create table agenda(
  codigo integer primary key not null,
  nome varchar(200) not null,
  fone varchar(100)
);

insert into agenda (codigo,nome,fone) values (1,'Thiago','15342');
insert into agenda (codigo,nome,fone) values (2,'Bruno','15432');
insert into agenda (codigo,nome,fone) values (3,'Thais','1552');

update agenda set fone = '12346',nome='Arthur' where codigo=1;

delete from agenda where codigo=3;
