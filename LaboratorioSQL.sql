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
foreign key (inciplaca) references automotores (autoplaca));


cod_cur_estcur int auto_increment,
doc_est_estcur varchar(11),
fec_ini_estcur date,

insert into profesor ("doc_prof", "nom_prof", "ape_prof", "cate_prof", "sal_prof")
values (63502720, "martha", "rojas", 2, 690000),
(91216904, "carlos", "perez", 3, 950000),
(13826789, "maritza", "angarita", 1, 550000),
(1098765789, "alejandra", "torres", 4, 1100000);

insert into estudiante_excurso (cod_cur_estcur, doc_est_estcur, fec_ini_estcur)
values (289011, , "2011-02-01"),
(250067, 250069, "2011-03-01"),
(289011, 13826787, "2011-02-01"),
(345671, 1098764789, "2011-04-01");

insert into estudiante (doc_est, nom_est, ape_est, edad_est)
values (63502620, "maria", "perez", 2),
(250069, "carlos jose", "lopez", 3),
(13826787, "jonatan", "ardila", 1),
(1098764789, "carlos", "martinez", 4);

DROP TABLE estudiante ;


insert into curso (cod_curs, nom_curs, horas_cur, valor_cur)
values (149862, "Fundamentos de bases de datos", 40, 500000),
(250069, "Fundamentos de SQL", 20, 3),
(13826787, "Manejo de Mysql", 45, 550000),
(1098764789, "Fundamentals", 60, 3000000);

-- Agregar primary key --

ALTER TABLE `LaboratorioSQL`.`Estudiante_excurso` 
DROP FOREIGN KEY `estudiante_excurso_ibfk_1`;
ALTER TABLE `LaboratorioSQL`.`Estudiante_excurso` 
CHANGE COLUMN `doc_est_estcur` `doc_est_estcur` VARCHAR(11) NOT NULL ,
ADD PRIMARY KEY (`cod_cur_estcur`, `doc_est_estcur`);
;
ALTER TABLE `LaboratorioSQL`.`Estudiante_excurso` 
ADD CONSTRAINT `estudiante_excurso_ibfk_1`
  FOREIGN KEY (`doc_est_estcur`)
  REFERENCES `LaboratorioSQL`.`Estudiante` (`doc_est`);

 
SELECT id_ped_artped, id_art_artped, articulo.tit_art, articulo.prec_art, can_art_artped 
FROM articulo_pedido 
INNER JOIN articulo 
ON articulo_pedido.id_art_artped = articulo.id_art

 -- Error Code: 1292. Incorrect date value: '-2012' for column 'fec_ini_estcur' at row 1
-- Error Code: 1452. Cannot add or update a child row: a foreign key constraint fails (`laboratorio_sql`.`estudiante_excurso`, CONSTRAINT `estudiante_excurso_ibfk_1` FOREIGN KEY (`cod_cur_estcur`) REFERENCES `curso` (`cod_curs`))
-- Error Code: 1064. You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near 'cod_cur_estcur int auto_increment, doc_est_estcur varchar(11), fec_ini_estcur da' at line 1
-- Error Code: 1136. Column count doesn't match value count at row 1

-- Error Code: 1824. Failed to open the referenced table 'auto_motores'
