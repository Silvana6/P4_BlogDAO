create table posts (
	id int(11) not  null auto_increment primary key,
	fecha date,
	titulo varchar(100),
	contenido text
);

select * from posts;

insert into posts (fecha, titulo, contenido) values ('2024/05/20', 'La tecnología', 'Lorem ipsun');
