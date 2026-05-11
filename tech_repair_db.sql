-- Tech Repair Database

/* 
Tabela
- clientes: id, nome, telefone, email
- dispositivos: id, client_id (FK -> clientes), modelo, marca
- ordens_servico: id, dispositivo_id (FK -> dispositivos), tecnicos_id 
    (FK -> tecnicos), descricao_problema, status ('Aguardando' | 'Em Andamento' | 'Pronto'), 
    data_abertura
- tecnicos: id, nome, especialidade
*/

create table clientes (
    id serial primary key,
    nome varchar(255) not null,
    telefone varchar(20),
    email varchar(255)
);

create table dispositivos (
    id serial primary key,
    client_id integer references clientes(id),
    modelo varchar(255) not null,
    marca varchar(255)
);

create table tecnicos (
    id serial primary key,
    nome varchar(255) not null,
    especialidade varchar(255)
);

create table ordens_servico (
    id serial primary key,
    dispositivo_id integer references dispositivos(id),
    tecnicos_id integer references tecnicos(id),
    descricao_problema text,
    status varchar(20) check (status in ('Aguardando', 'Em Andamento', 'Pronto')),
    data_abertura date not null
);