create database Laboratorio_SQL;

use Laboratorio_SQL;

create table profesor(
doc_prof varchar(11),
nom_prof varchar(30),
ape_prof varchar(30),
cate_prof int,
sal_prof int,
primary key (doc_prof)); 

create table curso(
cod_curs int auto_increment,
nom_curs varchar(100),
horas_cur int,
valor_cur int,
primary key (cod_curs)); 

create table estudiante(
doc_est varchar(11),
nom_est varchar(30),
ape_est varchar(30),
edad_est int,
primary key (doc_est)); 

create table estudiante_excurso(
cod_cur_estcur int auto_increment,
doc_est_estcur varchar(11),
fec_ini_estcur date,
foreign key (cod_cur_estcur) references curso (cod_curs),
foreign key (doc_est_estcur) references estudiante (doc_est)); 

create table cliente (
id_cli varchar(11),
nom_cli varchar(30),
ape_cli varchar(30),
dir_cli varchar(100),
dep_cli varchar(20),
mes_cum_cli varchar(10),
primary key (id_cli));

create table articulo (
id_art int auto_increment,
tit_art varchar(100),
aut_art varchar(100),
edi_art varchar(300),
prec_art int,
primary key (id_art));


create table pedido(
id_ped int auto_increment,
id_cli_ped varchar(11),
fec_ped date,
val_ped int,
primary key (id_ped),
foreign key (id_cli_ped) references cliente (id_cli));


create table articulo_pedido (
id_ped_artped int,
id_art_artped int,
can_art_artped int,
val_ven_art_artped int,
foreign key (id_ped_artped) references pedido (id_ped),
foreign key (id_art_artped) references articulo (id_art));

create table company(
comnit varchar(11),
comnombre varchar(30),
comyearfun int,
comeplegal varchar(100),
primary key (comnit));

create table tipos_automotores(
	autotipo int,
    primary key (autotipo));
    
create table automotores (
autoplaca varchar(6),
automarca varchar(30),
autotipo int,
autmodelo int,
autopasajeros int,
autocilindraje int,
autonumchasis varchar(20),
primary key(autoplaca),
foreign key (autotipo) references tipos_automotores (autotipo));

create table aseguramientos (
asecodigo int(6) auto_increment,
asefechainicio date,
asefechaexperisacion date ,
asevaloraseguramiento int,
aseestado varchar(20),
asecosto int ,
aseplaca varchar(6),
primary key (asecodigo),
foreign key (aseplaca) references automotores (autoplaca));

create table incidentes (
incicodigo int auto_increment,
incifecha date,
inciplaca varchar(6),
incilugar varchar(40),
inciantheridos int,
incianfatalidades int,
incicautosinvolucrados int,
primary key (incicodigo),
foreign key (inciplaca) references auto_motores (autoplaca));

