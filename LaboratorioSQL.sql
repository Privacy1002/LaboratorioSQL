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
asefechaexperisacion date,
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

-- Error Code: 1824. Failed to open the referenced table 'auto_motores'

use laboratorio_sql;

insert into profesor (doc_prof, nom_prof, ape_prof, cate_prof, sal_prof)
values 
(63502720, 'martha', 'rojas', 2, 690000),
(91216904, 'Carlos', 'Pérez', 3, 950000),
(13826789, 'Maritza', 'Angarita', 1, 550000),
(1098765789, 'Alejandra', 'Torres', 4, 1100000);

insert into curso (cod_curs, nom_curs, horas_cur, valor_cur)
values 
(149842, 'Fundamentos de bases de datos ', 40, 500000),
(250067, 'Fundamentos de SQL', 20, 700000),
(289011, 'Manejo de Mysql ', 45 , 550000),
(345671, 'Fundamentals of Oracle', 60, 3000000);

insert into estudiante (doc_est, nom_est, ape_est, edad_est)
values 
(63502720, 'María', 'Pérez', 2),
(91245678, 'Carlos José', 'López', 3),
(1098098097, 'Jonatan', 'Ardila' , 1),
(1098765679, 'Carlos', 'Martínez', 4);

insert into estudiante_excurso (cod_cur_estcur, doc_est_estcur, fec_ini_estcur)
values 
(289011, 1098765679, '2011-02-01'),
(250067, 63502720, '2011-03-01'),
(289011, 1098098097, '2011-02-01'),
(345671, 63502720, '2011-04-01');

insert into cliente (id_cli, nom_cli, ape_cli, dir_cli, dep_cli, mes_cum_cli)
values 
(63502718, 'Maritza', 'Rojas', 'Calle 34 No.14-45', 'Santander', 'Abril'),
(13890234, 'Roger', 'Ariza', 'Cra 30 No.13-45', 'Antioquia', 'Junio'),
(77191956, 'Juan Carlos', 'Arenas', 'Diagonal 23 No. 12-34 apto 101', 'Valle', 'Marzo'),
(1098765789, 'Catalina', 'Zapata', 'Av. El Libertador No. 30-14', 'Cauca', 'Marzo');

insert into articulo (tit_art, aut_art, edi_art, prec_art)
values 
('Redes cisco', 'Ernesto Arigasello', 'Alfaomega - Rama', 60.000),
('Facebook y Twitter para adultos', 'Veloso Claudio', 'Alfaomega', 52.000),
('Creación de un portal con php y mysql', 'Jacob Pavón Puertas', 'Alfaomega - Rama', 40.000),
('Administración de sistemas operativos', 'Julio Gómez López', 'Alfaomega - Rama', 55.000);

-- Error Code: 1054. Unknown column 'adi_art' in 'field list'

insert into pedido (id_cli_ped, fec_ped, val_ped)
values 
(63502718, '2012-02-25', 120000),
(77191956, '2012-04-30', 55000),
(63502718, '2011-12-10' , 260000),
(1098765789, '2012-02-25', 1800000);

insert into articulo_pedido (id_ped_artped, id_art_artped, can_art_artped, val_ven_art_artped)
values 
(1, 3 , 5, 40.000),
(1, 4 , 12, 55.000),
(2, 1 , 5, 65.000),
(3, 2 , 10, 55.000),
(3, 3 , 12, 45.000),
(4, 1 , 20, 65.000);

insert into company (comnit, comnombre, comyearfun, comeplegal)
values 
(800890890-2, 'Seguros Atlantida', 1998, 'Carlos López'),
(899999999-1, 'Aseguradora Rojas', 1991 , 'Luis Fernando Rojas'),
(899999999-5, 'Seguros del Estado' , 2001, 'María Margarita Pérez');

-- Error Code: 1146. Table 'laboratorio_sql.companyy' doesn't exist
-- Error Code: 1054. Unknown column 'id_ped_artped' in 'field list'

alter table tipos_automotores add column autnombre varchar(30) not null;

insert into tipos_automotores (autotipo, autnombre)
values 
(1, 'Automóviles'),
(2, 'Camperos'),
(3, 'Camiones');

insert into automotores (autoplaca, automarca, autotipo, autmodelo, autopasajeros, autocilindraje, autonumchasis)
values 
('FLL420', 'chevrolet corsa', 1, 2003, 5, 1400, 'wywzzz167kk009d25'),
('DKZ820', 'renault stepway', 1 , 2008, 5, 1600, 'wywwzz157kk009d45'),
('KJQ920', 'kia sportage' , 2, 2009, 7, 2000, 'wywzzz157kk009d25');

insert into aseguramientos (asefechainicio, asefechaexperisacion, asevaloraseguramiento, aseestado, asecosto, aseplaca)
values 
('2012-09-30', '2013-09-30', 30000000, 'Vigente', 500000 , 'FLL420'),
('2012-09-27', '2013-09-27', 35000000 , 'Vigente', 600000 , 'DKZ820'),
('2011-09-28', '2012-09-28', 50000000, 'Vigente', 800000 , 'KJQ920');


insert into incidentes (incifecha, inciplaca, incilugar, inciantheridos, incianfatalidades, incicautosinvolucrados)
values 
('2012-09-30', 'DKZ820', 'Bucaramanga', 0, 0, 2),
('2012-09-27', 'FLL420', 'Girón', 0, 0, 1),
('2011-09-28' , 'FLL420', 'Bucaramanga', 1, 0, 2);


-- Error Code: 1292. Incorrect date value: '30-09-2012' for column 'asefechainicio' at row 1
-- \\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\\ --
-- Error Code: 1146. Table 'laboratorio_sql.incidententes' doesn't exist
-- Error Code: 1146. Table 'laboratorio_sql.incidentes' doesn't exist

-- CODIGO DE SQL DE CONSULTA NUMERO #23 (Visualizar todos los datos de la póliza más costosa) --
SELECT * FROM aseguramientos WHERE asecosto = (SELECT MAX(asecosto) FROM aseguramientos);

-- CODIGO DE SQL DE CONSULTA NUMERO #15 ( Mostrar los pedidos con los respectivos artículos(código, nombre, valor y cantidad pedida) --
SELECT id_ped_artped AS ID_Pedido, id_art_artped AS ID_Articulo, articulo.tit_art AS Nombre_Articulo, articulo.prec_art AS Precio, can_art_artped AS Cantidad
FROM articulo_pedido INNER JOIN articulo ON articulo_pedido.id_art_artped = articulo.id_art
