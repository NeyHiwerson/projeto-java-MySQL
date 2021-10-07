-- comentarios
-- a linha abaixo cria um banco de dados
create database dbinfox;
-- a linha abaixo escolhe o banco de dados
use dbinfox;
-- o bloco de instruções abaixo cria uma tabela
create table tbusuarios(
iduser int primary key,
usuario varchar(50) not null,
fone varchar(15),
login varchar(15) not null unique,
senha varchar(15) not null
);
-- o comando abaixo descreve a tabela
describe tbusuarios;
-- a linha abaixo insere dados na tabela (CRUD)
-- create -> insert
insert into tbusuarios(iduser,usuario,fone,login,senha)
values(1,'José de Assis','9999-9999','joseassis','123456');
-- a linha abaixo exibe os dados da tabela (CRUD)
-- read -> select
select * from tbusuarios;
-- vamos inserir mais dois usuarios
insert into tbusuarios(iduser,usuario,fone,login,senha)
values(2,'Administrador','9999-9999','admin','admin');
insert into tbusuarios(iduser,usuario,fone,login,senha)
values(3,'Bill Gates','9999-9999','bill','123456');
-- vamos ver novamente a tabela (CRUD)
select * from tbusuarios;

-- a linha abaixo modifica dados na tabela (CRUD)
-- update -> update
update tbusuarios set fone= '8888-8888' where iduser=2;

-- a linha abaixo apaga um registro da tabela (CRUD)
-- delete -> delete
delete from tbusuarios where iduser=3;

select * from tbusuarios;

create table tbclientes(
idcli int primary key auto_increment,
nomecli varchar(50) not null,
endcli varchar(100),
fonecli varchar(50) not null,
emailcli varchar(50)
);

describe tbclientes;

insert into tbclientes(nomecli,endcli,fonecli,emailcli)
values('Linus Torvalds',' Rua Tux,2021','047 99999-9999','linus@linux.com');

select * from tbclientes;

create table tbos(
os int primary key auto_increment,
data_os timestamp default current_timestamp,
equipamento varchar(150) not null,
defeito varchar(150) not null,
servico varchar(150),
tecnico varchar(30),
valor decimal(10,2),
idcli int not null,
foreign key (idcli) references tbclientes(idcli) 
);

describe tbos;
-- a linha abaixo altera a tabela adicionando um campo em uma determinada posição
alter table tbos add tipo varchar(15) not null after data_os;
alter table tbos add situacao varchar(20) not null after tipo;
-- a linha abaixo descreve os registros da tbos
select * from tbos;
-- a linha abaixo faz a criação de registros na tbos
insert into tbos (equipamento,defeito,servico,tecnico,valor,idcli)
values ('notebook','não liga','troca da fonte','zé',87.50,1);




-- o codigo abaixo traz informações de duas tabelas
select
O.os,equipamento,defeito,servico,valor,
C.nomecli,fonecli
from tbos as O
inner join tbclientes as C
on (O.idcli = C.idcli);

insert into tbusuarios(iduser,usuario,fone,login,senha)
values(3,'Leandro Ramos','999-9999','leandro','123');

use dbinfox;
describe tbusuarios;
select * from tbusuarios;
-- a linha abaixo adiciona um campo a tabela
alter table tbusuarios add column perfil varchar(20) not null;
-- a linha abaixo remove um campo da tabela
-- alter table tbusuarios drop column perfil;

update tbusuarios set perfil='admin' where iduser=1;
update tbusuarios set perfil='admin' where iduser=2;
update tbusuarios set perfil='user' where iduser=3;


select * from tbclientes;
select idcli,nomecli,fonecli from tbclientes where nomecli like 'jo%';
-- A LINHA ABAIXO CRIA UM APELIDO AOS CAMPOS DA TABELA
select idcli AS Id,nomecli AS Nome,fonecli as Fone,emailcli as email from tbclientes where nomecli like 'joa%';
alter table tbclientes drop column baicli;
alter table tbclientes drop column citcli;
-- A LINHA ABAIXO REMOVE UM CLIENTE
-- delete from tbclientes where idcli=1;

-- A instrução abaixo seleciona e ordena por nome todos os clientes cadastrados
select * from tbclientes order by nomecli;

