
create table customers(
id numeric(20)not null primary key,
name varchar(20),
street varchar(20),
city varchar(20),
state char(20),
credit_limit numeric
)

insert into customers(id,name,street,city,credit_limit)
values(1,'Pedro Augusto da Rocha','Rua Pedro Carlos Hoffman','Porto Alegre','RS',70000)

drop table customers