import react, {useState} from 'react';
import {View, Text, StyleSheet, Alert } from 'react-native';
import {TextInput, Button} from 'react-native-paper';
import Header from '../components/Header';

import Colors from '../config/Colors';

import {login} from '../services/auth.services';

import { useNavigation } from '@react-navigation/native';
import {useUser} from '../context/UserContext';

import AsyncStorage from '@react-native-async-storage/async-storage';

const LoginPage = () => {

  const navigation = useNavigation();

  const {signed, setSigned, setName} = useUser();

  const [email, setEmail] = useState("");
  const [senha, setSenha] = useState("");

  if (signed) {
    navigation.goBack();
  }

  const handleLogin = () => {
    login({
      email: email,
      password: senha
    }).then( res => {
      if(res && res.user){
        setSigned(true);
        setName(res.user.name);
        AsyncStorage.setItem('@TOKEN_KEY', res.accessToken).then();
        navigation.navigate('HomePage')
      }else{
         Alert.alert('Atenção', 'Usuário ou senha inválidos!');
      }

    });
  }

  return (
    <View style = {styles.loginPage}>
      <Header
      goBackEnabled={true}
      />
        <View style={styles.loginPageContainer}>
          <Text style={{fontSize: 24, marginBottom: 16}}>
            Fazer login
          </Text>
          <TextInput
          style={styles.registerTextInput}
          label="Email"
          value={email}
          mode= {"outlined"}
          left={<TextInput.Icon name="email" />}
          onChangeText={email => setEmail(email)}
        />
              <TextInput
          style={styles.registerTextInput}
          label="Senha"
          value={senha}
          secureTextEntry
          mode= {"outlined"}
          left={<TextInput.Icon name="key" />}
          onChangeText={senha => setSenha(senha)
          }
        />
        <View style={styles.botoesContainer}>
          <Button style={styles.botaoRegistrar} mode="outlined" onPress={() => navigation.navigate('RegisterPage')}>
            <Text style={styles.botaoRegistrarText}>Registrar-se</Text>
          </Button>
          <Button style={styles.botaoLogin} mode="contained" onPress={handleLogin}>
            <Text style={styles.botaoLoginText}>Entrar</Text>
          </Button>
        </View>
        <Text style={styles.esqueceuSuaSenha}>Esqueceu sua senha?</Text>
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  loginPage: {
    alignItems: 'center',
    backgroundColor: Colors.backgroundColor,
    flex: 1
  },
    loginPageContainer: {    
    alignItems: 'center',
    width: '100%',
    flex: 1,
    marginTop: '20%',
    
  },
  registerTextInput: {
    width: "95%",
  },
  botoesContainer: {
    width: '100%',
    flexDirection: 'row',
    justifyContent: 'center',
    marginTop: 16
  },  
    botaoLogin: {
    width: "45%",
    marginTop: 8,
    backgroundColor: Colors.primaryColor,
    borderRadius: 16
  },
  botaoLoginText: {
    fontSize: 12,
  },
  botaoRegistrar: {
    width: "45%",
    marginTop: 8,
    marginRight: 5,
    borderRadius: 16
  },
    botaoRegistrarText: {
    fontSize: 12,
    color: Colors.primaryColor
  },
 esqueceuSuaSenha: {
    fontSize: 16,
    fontWeight: 'bold',
    marginTop: 16,
    color: Colors.primaryColor
  }
});

export default LoginPage;