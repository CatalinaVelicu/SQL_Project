-- Crearea unei baze de date de gestiune a bijuteriilor

create database jewerly;

create table jewerly 
(
id_jewel int primary key,
jewerly_name varchar (100),
jewerly_type varchar (20),
jewerly_material varchar (20),
precious_stones varchar (100),
color varchar (50),
weight float,
jewerly_description text,
stock int,
price float,
date_added date,
rating float
);

alter table jewerly
add column gem varchar(25);

alter table jewerly
drop gem;

alter table jewerly modify jewerly_material varchar(25) not null;

desc jewerly;

create table type_
(
type_id int primary key,
type_name varchar(30),
type_code char(2)
);

create table jewel_type
(
jewel_type_id int primary key,
jewel_id int,
type_id int,
foreign key (jewel_id) references jewerly(id_jewel),
foreign key (type_id) references type_(type_id)
);


create table material
(
material_id int primary key,
material_name varchar(30),
material_code char(2)
);

create table jewel_material
(
jewel_material_id int primary key,
jewel_id int,
material_id int,
foreign key (jewel_id) references jewerly(id_jewel),
foreign key (material_id) references material(material_id)
);

drop table if exists type_, jewel_type;

create table precious_stone
(
ps_id int primary key,
ps_name varchar(30),
country_of_origin varchar(50),
color varchar(20),
weight float
);

alter table jewerly modify precious_stones int;

alter table jewerly add constraint foreign_key_ps_jewerly foreign key (precious_stones)
references precious_stone(ps_id);

alter table jewerly rename column precious_stones to precious_stones_id;
alter table jewerly add column gender varchar (8);

desc jewerly;
desc precious_stone;

alter table jewerly add column brand varchar (70);
alter table jewerly
drop brand;
alter table jewerly rename column brand to jewerly_brand;

-- creez o tabela care sa descrie entitatea brand
create table brand
(
brand_id int primary key,
brand_name varchar (100),
country varchar (100),
year_founded date
);

alter table jewerly add constraint foreign_key_brand_jewerly foreign key (brand_id) references brand(brand_id);

alter table jewerly modify jewerly_brand int;
alter table jewerly rename column jewerly_brand to brand_id;

insert into brand (brand_id,  brand_name, country, year_founded) values
(1, "Coco", "SUA", "1998-03-03");
insert into brand (brand_id,  brand_name, country, year_founded) values
(2, "Mell", "SUA", "1999-05-10");

select * from brand;
describe brand;

alter table jewerly drop foreign key foreign_key_brand_jewerly;
truncate table brand;

update brand
set brand_name = 'chanel'
where brand_id = 1;
delete from brand where brand_id = 1;

select * from jewerly;

select jewerly_name, price from jewerly;

select * from jewerly where price > 100;

select * from jewerly where jewerly_name like '%Ring%';

select * from jewerly
where (color = 'gold' or jewerly_material = 'gold') and price > 150;


select avg(price) as average_price from jewerly;
select count(*)
from jewerly;
select sum(price)
from jewerly;


select jewerly.jewerly_name, brand.brand_name 
from jewerly
inner join brand on jewerly.brand_id = brand.brand_id;

select jewerly.jewerly_name, brand.brand_name 
from jewerly
left join brand on jewerly.brand_id = brand.brand_id;

select jewerly.jewerly_name, brand.brand_name 
from jewerly
right join brand on jewerly.brand_id = brand.brand_id;

select jewerly.jewerly_name, brand.brand_name
from jewerly
cross join brand;

select * from jewerly limit 3;
select * from jewerly order by price desc;
select * from jewerly where price = (select min(price) from jewerly);

select * from jewerly 
where price > (select avg(price) from jewerly);







