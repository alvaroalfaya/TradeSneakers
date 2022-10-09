-- Cria a tabela de usuários

CREATE TABLE Usuario(
IdUsuario INT NOT NULL,
Email varchar(50),
Nome_Usuario varchar(50),
Senha varchar(50),
Telefone varchar(50),
PRIMARY KEY(IdUsuario)
);

-- Cria a tabela de administrador

CREATE TABLE Administrador(
IdAdministrador INT NOT NULL,
PRIMARY KEY(IdAdministrador)
FOREIGN KEY (IdAdministrador) REFERENCES usuario(IdUsuario),
);

-- Cria a tabela de usuários comuns

CREATE TABLE Usuario_comum(
IdUsuario INT NOT NULL,
Nome varchar(50),
Sobrenome varchar(50),
PRIMARY KEY(IdUsuario)
FOREIGN KEY (IdUsuario) REFERENCES usuario(IdUsuario),
);

-- Cria a tabela de endereço

CREATE TABLE Endereco(
IdEndereco INT NOT NULL,
Logradouro varchar(50),
Cidade varchar(50),
Estado varchar(50),
Pais varchar(50),
Cep varchar(50),
PRIMARY KEY (IdEndereco),
FOREIGN KEY (IdUsuario) REFERENCES usuario(IdUsuario),
);

-- Cria a tabela de Mensagem

CREATE TABLE Mensagem(
IdMensagem int NOT NULL,
IdRemetente int NOT NULL,
IdDestinatario int NOT NULL,
Assunto varchar(50),
Conteudo varchar(50),
VisualizadaOuNao NOT NULL,
PRIMARY KEY (IdMensagem),
FOREIGN KEY (IdRemetente) REFERENCES usuario(IdUsuario),
FOREIGN KEY (IdDestinatario) REFERENCES usuario(IdUsuario),
);

-- Cria a tabela de Pedido

CREATE TABLE Pedido(
IdPedido int NOT NULL,
IdUsuario int NOT NULL,
IdVendedor int NOT NULL,
DataPedido varchar(50),
DataEnvio varchar(50),
PedidoFechado NOT NULL,
PedidoEntregue NOT NULL,
PRIMARY KEY (IdPedido),
FOREIGN KEY (IdUsuario) REFERENCES usuario(IdUsuario),
FOREIGN KEY (IdVendedor) REFERENCES usuario(IdUsuario),
);

-- Cria a tabela de Produto

CREATE TABLE Produto(
IdProduto int NOT NULL,
IdUsuario int NOT NULL,
Nome varchar(50),
Marca varchar(50),
Numeracao int ,
Descricao varchar(50),
Preco float,
PRIMARY KEY (IdProduto),
FOREIGN KEY (IdUsuario) REFERENCES usuario(IdUsuario),
);

-- Cria a tabela de Foto

CREATE TABLE Fotos_Produto(
IdFotoProduto int NOT NULL,
IdProduto int NOT NULL,
UrlDaImage varchar(50),
PRIMARY KEY (IdFotoProduto),
FOREIGN KEY (IdProduto) REFERENCES produto(IdProduto)
);

-- Cria a tabela de Troca

CREATE TABLE Proposta_troca(
IdProposta int NOT NULL,
IdUsuario int NOT NULL,
IdVendedor int NOT NULL,
CustoEnvio float,
Mensagem varchar(50),
PropostoAceitaOuNao NOT NULL,
PRIMARY KEY (IdProposta),
FOREIGN KEY (IdUsuario) REFERENCES Usuario(IdUsuario),
FOREIGN KEY (IdVendedor) REFERENCES usuario(IdUsuario),
);