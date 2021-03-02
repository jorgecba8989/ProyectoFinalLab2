create database ProyectoLab2
go

use ProyectoLab2
go


drop table Listados_Videos
drop table Listados
drop table Comentarios
drop table Likes_Videos
drop table Visitas_Videos
drop table Usuarios
drop table Videos
drop table Categorias



create table Categorias
(
	Nro_categoria		smallint		not null,
	Nom_categoria		varchar(80)		not null,
	primary key (Nro_categoria)
)
go

create table Usuarios
( 
	Nro_usuario					 smallint		not null,
	Nom_usuario					 varchar(80)	not null,
	Apellido_usuario			 varchar(80)	not null,
	Clave_usuario				 varchar(80)	not null,
	Verificacion_clave_usuario   varchar(80)	not null,
	Email_usuario				 varchar(80)	not null,
	Alias_usuario				 varchar(80)	not null,
	primary key (Nro_usuario) 
)
go

create table Videos
(
	Nro_video				smallint		not null,
	Nom_cantante_video		varchar(80)		not null,
	Nom_titulo_video		varchar(80)		not null,
	Url_video				varchar(80)		not null,
	Link_descarga			varchar(255)	not null,
	Nro_visita_video		smallint		not null,
	Nro_categoria			smallint		not null,
	Like_Video				smallint		not null,
	Imagen_Video			varchar(80)		not null,
	primary key (Nro_video),
	foreign key (Nro_categoria) references Categorias
)
go


create table Comentarios
(
	Nro_comentario				smallint		not null,
	Descripcion_comentario		varchar(80)		not null,
	Fecha_comentario			date			not null,
	Nro_usuario					smallint		not null,
	Nro_video					smallint		not null
	primary key (Nro_comentario,Nro_usuario,Nro_video),
	foreign key (Nro_usuario) references Usuarios,
	foreign key (Nro_video) references Videos
)
go


create table Likes_Videos
( 
	Nro_usuario				smallint		not null,
	Nro_video				smallint		not null,
	Cant_Like				smallint		not null,
	primary key (Nro_usuario,Nro_video),
	foreign key (Nro_usuario) references Usuarios,
	foreign key (Nro_video) references Videos
)
go


create table Visitas_Videos
( 
	Nro_usuario          smallint		not null,
	Nro_video			 smallint		not null,
	Cant_visita			 smallint		not null,
	primary key (Nro_usuario,Nro_video),
	foreign key (Nro_usuario) references Usuarios,
	foreign key (Nro_video) references Videos
)
go



create table Listados
( 
	Nro_listado          smallint		not null,
	Nro_usuario          smallint		not null,
	Nom_listado          varchar(80)	not null,
	primary key (Nro_listado,Nro_usuario),
	foreign key (Nro_usuario) references Usuarios
)
go



CREATE TABLE Listados_Videos
( 
	Nro_listado          smallint		not null,
	Nro_usuario          smallint		not null,
	Nro_video            smallint		not null,
	primary key (Nro_listado,Nro_usuario,Nro_video),
	foreign key (Nro_listado,Nro_usuario) references Listados,
	foreign key (Nro_video) references Videos,
	foreign key (Nro_usuario) references Usuarios
)
go


insert into Categorias(Nro_categoria,Nom_categoria)
values	(1,'Electro')
	,	(2,'Pop')
	,	(3,'Cumbia')
	,	(4,'Cuarteto')
	,	(5,'Rock')
	,	(6,'80/90')
	,	(7,'Reggaeton')
	,	(8,'En vivo')
go


insert into Videos (Nro_video,Nro_categoria,Nom_cantante_video,Nom_titulo_video,Url_video,Link_descarga,Nro_visita_video,Like_Video,Imagen_Video)
values	(1,1,'David Guetta','Play Hard','https://www.youtube.com/embed/5dbEhBKGOtY','http://zto.today/DownloadMusic/David Guetta - Play Hard.mp3',0,0,'./img/david.gif')
	,	(2,7,'Daddy Yankee','Lovumba','https://www.youtube.com/embed/9TeyuDnwyrw','http://zto.today/DownloadMusic/Daddy Yankee - Lovumba.mp3',0,0,'./img/daddy.gif')
	,	(3,2,'Alejandro Sanz','No Es Lo Mismo','https://www.youtube.com/embed/VaK6bmvohfY','http://zto.today/DownloadMusic/Phil Collins - The First Farewell Tour Paris 2004.mp3',0,0,'./img/aleSanz.gif')
	,	(4,6,'Modern Talking','You are My Heart, You are My Soul','https://www.youtube.com/embed/4kHl4FoK1Ys','http://zto.today/DownloadMusic/Modern Talking - You are my heart, you are my soul.mp3',0,0,'./img/Modern.gif')
	,	(5,8,'Abel Pintos','Completo','https://www.youtube.com/embed/ySZvqDHi8Y0','http://zto.today/DownloadMusic/Abel Pintos - Completo.mp3',0,0,'./img/abelPinto.gif')
	,	(6,8,'Robbie Williams','Live concert 2019','https://www.youtube.com/embed/jas77co4Hoo','http://zto.today/DownloadMusic/Robbie williams - In concert 2019.mp3',0,0,'./img/robbieW.gif')
	,	(7,8,'Shakira','El dorado world tour','https://www.youtube.com/embed/x5HdVARuOfg','http://zto.today/DownloadMusic/Shakira - El Dorado World Your.mp3',0,0,'./img/shakira.gif')
	,	(8,8,'Phil Collins','The first farewell tour paris','https://www.youtube.com/embed/cPzrZ-1g-7U','http://zto.today/DownloadMusic/Phil Collins - The First Farewell Tour Paris 2004.mp3',0,0,'./img/philCollins.gif')
go



/* ------------------------------------------
				Chequeo para Loguearse
   ------------------------------------------ */

select *
from Usuarios
where Nom_usuario = @Nom_usuario and Clave_usuario = @Clave_usuario



/*
------------------------------------------------------------------
	Para obtener las categorias y mostrarlo con radiobutton
------------------------------------------------------------------
*/
drop procedure dbo.get_categorias_videos

create procedure dbo.get_categorias_videos
as
begin
	select Nom_categoria, Nro_categoria
	from Categorias(nolock)
	order by Nom_categoria
end;
go


/* ----------------------------------------------
				Consulta de videos
   ---------------------------------------------- */
declare @nro_categoria		tinyint = 7,
        @string_busqueda	varchar(255)

select c.Nom_categoria,
       v.Nro_categoria,
       v.Nom_titulo_video,
	   v.Nom_cantante_video,
	   v.Url_video,
	   v.Nro_video,
	   v.Like_Video,
	   v.Nro_visita_video,
	   v.Imagen_Video,
	   v.Link_descarga
  from Videos v (nolock)
       join Categorias c (nolock)
	     on v.Nro_categoria = c.Nro_categoria
 where (@Nro_categoria  is null
    or  v.Nro_categoria = @Nro_categoria)
   and  v.Nom_titulo_video + ' ' + v.Nom_cantante_video + ' ' + v.Nom_titulo_video like '%' + isnull(ltrim(rtrim(@string_busqueda)), '') + '%' 
 order by c.Nom_categoria,
          v.Nom_titulo_video;
go



/* ----------------------------------------------
				Insertar Usuario
   ---------------------------------------------- */
   drop procedure ins_Usuarios

   create procedure ins_Usuarios
(
	@Nom_usuario			varchar(80),
	@Apellido_usuario		varchar (80),
	@Clave_usuario			varchar(80),
	@Verificacion_clave_usuario        varchar(80),
	@Email_usuario        varchar(80),
	@Alias_usuario        varchar(80)  
)as
begin
  declare @Nro_usuario integer

  select @Nro_usuario = isnull(max(Nro_usuario), 0) + 1
  from Usuarios 

  insert into Usuarios(Nro_usuario,Nom_usuario,Apellido_usuario,Clave_usuario,Verificacion_clave_usuario,Email_usuario,Alias_usuario)
  values(@Nro_usuario,@Nom_usuario,@Apellido_usuario,@Clave_usuario,@Verificacion_clave_usuario,@Email_usuario,@Alias_usuario)
  
 end
 go 


 /* ----------------------------------------------
				Insertar una Lista
   ---------------------------------------------- */
   drop procedure ins_Listados

   create procedure ins_Listados
(
	@Nom_listado        varchar(80) ,
	@Alias_usuario		varchar(80)
)as
begin
  declare @Nro_listado integer
  declare @Nro_usuario          integer

	select @Nro_listado = isnull(max(Nro_listado), 0) + 1
	from Listados 

	select @Nro_usuario=Nro_usuario
	from Usuarios u
	where u.Alias_usuario=@Alias_usuario
 
	insert into Listados(Nro_listado,Nro_usuario ,Nom_listado)
	values (@Nro_listado, @Nro_usuario, @Nom_listado)

 end
 go 



/* ----------------------------------------------
			Mostrar la Lista del usuario
   ---------------------------------------------- */
   drop procedure get_listado_usuario

create procedure get_listado_usuario
(
	@Alias_usuario	varchar(80)
)
as
begin
	select l.Nom_listado
	from Listados l
	join Usuarios u on u.Nro_usuario = l.Nro_usuario
	where u.Alias_usuario = @Alias_usuario
	order by l.Nom_listado asc
end
go



 /* ------------------------------------------
			Inserción de video en listado
   ------------------------------------------ */

    drop procedure ins_Video_Listado

   create procedure ins_Video_Listado
(
	@Nom_listado        varchar(80),
	@Url_Video			varchar(80),
	@Alias_usuario		varchar(80) 
)
as
begin
  declare @Nro_Video	integer
  declare @Nro_Listado	integer
  declare @Nro_usuario	integer

	select @Nro_Video=Nro_Video
	from Videos v
	where v.Url_Video=@Url_Video
 
	select  @Nro_Listado= Nro_Listado
	from Listados l
	where l.Nom_listado= @Nom_Listado

	select @Nro_usuario=Nro_usuario
	from Usuarios u
	where u.Alias_usuario=@Alias_usuario

	insert into Listados_Videos(Nro_listado,Nro_usuario,Nro_video)
	values(@Nro_listado,@Nro_usuario,@Nro_video)
 end
 go 

 


/* ----------------------------------------------
				Insertar  Comentarios
   ---------------------------------------------- */
   drop procedure ins_Comentario

   create procedure ins_Comentario
(
	@Descripcion_comentario       varchar(80),
	@Alias_usuario				  varchar(80),
	@Url_Video					  varchar(80) 
)
as
begin
  declare @Nro_comentario integer
  declare @Nro_usuario    integer
  declare @Nro_Video	integer
  declare @Fecha_comentario	date

	select @Fecha_comentario = CONVERT (date, GETDATE()), @Nro_comentario = isnull(max(Nro_comentario), 0) + 1
	from Comentarios
	
	select @Nro_usuario=Nro_usuario
	from Usuarios u
	where u.Alias_usuario=@Alias_usuario

	select @Nro_Video=Nro_Video
	from Videos v
	where v.Url_Video=@Url_Video
 
	insert into Comentarios(Nro_comentario,Nro_usuario,Nro_video,Descripcion_comentario,Fecha_comentario)
	values(@Nro_comentario,@Nro_usuario,@Nro_video,@Descripcion_comentario, @Fecha_comentario)
 end
 go 

 
 

/* ----------------------------------------------
	Mostrar los Comentarios de un Video en especifico
   ---------------------------------------------- */
 drop procedure get_Comentario_Video

   create procedure get_Comentario_Video
(
	@Url_Video		varchar(80) 
)as
begin

  declare @Nro_Video	integer


	select Descripcion_comentario=c.Descripcion_comentario,Fecha_comentario = FORMAT(c.Fecha_comentario, 'dd-MM-yyyy'), Nro_usuario = (select u.Alias_usuario from Usuarios u ) 
 from Comentarios c
 join Videos v on v.Nro_video = c.Nro_video 
	where v.Url_Video=@Url_Video
 order by Fecha_comentario desc

 end
 go 

execute get_Comentario_Video @Url_Video='https://www.youtube.com/embed/5dbEhBKGOtY'
go


 /* ------------------------------------------
		Elimina video de un listado especifico
   ------------------------------------------ */
  
 delete Listados_Videos
 from Listados_Videos 
 join Listados on listados.Nro_listado = Listados_Videos.Nro_listado
 join Videos on Videos.Nro_video=Listados_Videos.Nro_video
 where  Listados_Videos.Nro_video=@Nro_video and Listados_Videos.Nro_listado=@Nro_listado
 


 /* ------------------------------------------
		Mostrar videos en listado del usuario
   ------------------------------------------ */
drop procedure get_Playlist

create procedure get_Playlist
(
	@Nom_listado        varchar(80),
	@Alias_usuario		varchar(80) 
)
as
begin
  declare @Nro_listado	integer
  declare @Nro_usuario integer

  	select @Nro_usuario=Nro_usuario
	from Usuarios u
	where u.Alias_usuario=@Alias_usuario

	select Nom_cantante_video= v.Nom_cantante_video , Nom_titulo_video=v.Nom_titulo_video, Url_video=v.Url_video ,Nom_listado=l.Nom_listado,Like_Video=v.Like_Video, Nro_listado=l.Nro_listado, Nro_video=v.Nro_video, Nro_visita_video= v.Nro_visita_video, Link_descarga = v.Link_descarga
	from Listados_Videos lv
	join Videos v on lv.Nro_video=v.Nro_video
	join Listados l on l.Nro_listado = lv.Nro_listado
	where l.Nom_listado= @Nom_listado and l.Nro_usuario = @Nro_usuario
 end
 go 
 



/* ------------------------------------------
		Dar likes positivos a un Video
   ------------------------------------------ */

drop procedure act_likes_video

create procedure act_likes_video
(
	 @Url_Video		varchar(80),
	 @Alias_usuario	varchar(80),
	 @Cant_Like		integer			
)
as
begin

	declare @Nro_video		integer
	declare @Nro_usuario    integer


	select @Nro_Video=Nro_Video
	from Videos v
	where v.Url_Video=@Url_Video 

	select @Nro_usuario=Nro_usuario
	from Usuarios u
	where u.Alias_usuario=@Alias_usuario	

    if not exists(	select 1
					from Likes_Videos (nolock)
					where Nro_video = @Nro_video
					and Nro_usuario = @Nro_usuario )

	select @Cant_Like = isnull(max(Cant_Like), 0) + 1
    from Likes_Videos 

    insert into Likes_Videos(Nro_video, Nro_usuario,Cant_Like)
	values(@Nro_video, @Nro_usuario,@Cant_Like)

	UPDATE d
	set d.Like_Video =(	select count(*)
						from Likes_Videos co (nolock)
	 					where co.Nro_video= d.Nro_video	)
	from Videos d 
	inner join Likes_Videos o on d.Nro_video = o.Nro_video 
end
go



 /* ------------------------------------------
			Mostrar datos del usuario
   ------------------------------------------ */
drop procedure get_datos_usuario

create procedure get_datos_usuario
(
	@Alias_usuario	varchar(80)
)
as
begin
  select Nom_usuario, Apellido_usuario, Clave_usuario, Verificacion_clave_usuario,Email_usuario,Alias_usuario
  from Usuarios 
  where Alias_usuario = @Alias_usuario
end
go


/* ------------------------------------------
			Actualizar datos del usuario
   ------------------------------------------ */
  
declare @Nom_usuario varchar(50)		= 'jorge',
        @Apellido_usuario		varchar(100)	= 'milia',
		@Clave_usuario			varchar(50)		= '121212',
		@Verificacion_clave_usuario			varchar(50)			= '121212',
		@Email_usuario		varchar(50) = 'pkgeorgecba@hotmail.com' 


 /* ------------------------------------------
			El visto de un Video
   ------------------------------------------ */

drop procedure act_visita_video

create procedure act_visita_video
(
 @Url_Video			varchar(80),
 @Alias_usuario		varchar(80),
 @Cant_visita		integer			
)
as
begin

	declare @Nro_video		integer
	declare @Nro_usuario    integer


	select @Nro_usuario=Nro_usuario
	from Usuarios u
	where u.Alias_usuario=@Alias_usuario	

	select @Nro_Video=Nro_Video
	from Videos v
	where v.Url_Video=@Url_Video

	if not exists (	 select 1
					 from Visitas_Videos (nolock)
					 where Nro_video = @Nro_video
					 and Nro_usuario = @Nro_usuario	)

	select @Cant_visita = isnull(max(Cant_visita), 0) + 1
    from Visitas_Videos 

     insert into Visitas_Videos(Nro_usuario,Nro_video,Cant_visita)
	 values(@Nro_usuario, @Nro_video,@Cant_visita)


	UPDATE d
	set d.Nro_visita_video = (	select count(*)
								from Visitas_Videos co (nolock)
								where co.Nro_video= d.Nro_video	)
	from Videos d 
	inner join Visitas_Videos o ON d.Nro_video = o.Nro_video 

 	   
end
go





select * from Comentarios

select * from Videos