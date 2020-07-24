use master
go
drop database TP_Final_TrejoCarlos
go
Create Database TP_Final_TrejoCarlos
go
Use TP_Final_TrejoCarlos
go
Create Table Choferes(
	ID int not null identity (1, 1),
	Legajo int not null,
	Apellidos varchar(100) not null,
	Nombres varchar(100) not null,
	Sexo varchar(50) null,
	FechaNac datetime null,
	Estado char(1) not null
)
go
Create Table Micros(
	ID int not null identity (1, 1),
	Patente varchar(100) not null,
	Modelo int null,
	FechaFabr datetime not null,
	CantAsientos int null,
	Estado char(1) not null
)
go

Create Table TerminalesDestino(
	ID int not null identity (1, 1),
	CodTerminal varchar(50) not null,
	NomTerminal varchar(100) not null,
	Estado char(1) not null
)
go
Create Table TerminalesOrigen(
	ID int not null identity (1, 1),
	CodTerminal varchar(50) not null,
	NomTerminal varchar(100) not null,
	Estado char(1) not null
)
go
Create Table Usuarios(
	ID int not null identity (1, 1),
	CodUsuario varchar(50) not null,
	TipoUsuario varchar(50) not null,
	Email varchar(100) not null,
	Sexo varchar(50) null,
	FechaReg datetime null,
	FechaNac datetime null,
	Estado char(1) not null,
	Clave varchar(100) not null
)
go
Create Table Viajes(
	ID int not null identity (1, 1),
	IdTerminalOrigen int not null,
	IdTerminalDestino int not null,
	IdMicro int not null,
	IdChofer int not null,
	FechaViaje datetime not null,
	Precio money not null,
	CodViaje varchar(50) not null
)

Create Table Pasajes(
	ID int not null identity (1, 1),
	CodBoleto varchar(50) not null,
	IdViaje int not null,
	CantBoletos int not null,
	TotalPrecio money not null
)
go


/* Restricciones */
-- Primary key
Alter Table Choferes
Add Constraint PK_Choferes Primary key (ID)
go
Alter Table Micros
Add Constraint PK_Micros Primary key (ID)
go
Alter Table Pasajes
Add Constraint PK_Pasajes Primary key (ID)
go
Alter Table TerminalesDestino
Add Constraint PK_TerminalesDestino Primary key (ID)
go
Alter Table TerminalesOrigen
Add Constraint PK_TerminalesOrigen Primary key (ID)
go
Alter Table Usuarios
Add Constraint PK_Usuarios Primary key (ID)
go
Alter Table Viajes
Add Constraint PK_Viajes Primary key (ID)
go

-- Foreign Key
Alter Table Viajes
Add constraint FK_ViajesChofer Foreign Key(IDChofer) references Choferes(ID)
go
Alter Table Viajes
Add constraint FK_ViajesMicro Foreign Key(IDMicro) references Micros(ID)
go
Alter Table Viajes
Add constraint FK_ViajesTerminalOrigen Foreign Key(IDTerminalOrigen) references TerminalesOrigen(ID)
go
Alter Table Viajes
Add constraint FK_ViajesTerminalDestino Foreign Key(IDTerminalDestino) references TerminalesDestino(ID)
go
Alter Table Pasajes
Add constraint FK_PasajesViajes Foreign Key(IDViaje) references Viajes(ID)
go
--Restriccion check para que el origen no sea el mismo que el destino
ALTER TABLE [dbo].[Viajes]  WITH CHECK ADD CONSTRAINT [CK_Viajes_IdTerminalOrigen_IdTerminalDestino_DebenSerDistintos] CHECK  (([IdTerminalOrigen]<>[IdTerminalDestino]))
GO
ALTER TABLE [dbo].[Viajes] CHECK CONSTRAINT [CK_Viajes_IdTerminalOrigen_IdTerminalDestino_DebenSerDistintos]
GO

--Datos

insert into Choferes (Legajo, Apellidos, Nombres, Sexo, FechaNac, Estado) Values (100, 'Trejo', 'Carlos', 'Varon', 01/03/1989, 'A')
go
insert into Choferes (Legajo, Apellidos, Nombres, Sexo, FechaNac, Estado) Values (200, 'Piriz', 'Jaime', 'Masculino', 04/08/1989, 'A')
go
insert into Choferes (Legajo, Apellidos, Nombres, Sexo, FechaNac, Estado) Values (333, 'Ramirez', 'Sergio', 'Trans', 15/08/1992, 'A')
go
insert into Micros (Patente, Modelo, FechaFabr, CantAsientos, Estado) Values ('B200', 1970, 15/12/1971, 62, 'A')
go
insert into Micros (Patente, Modelo, FechaFabr, CantAsientos, Estado) Values ('C250', 1999, 1/1/1999, 61, 'A')
go
insert into Micros (Patente, Modelo, FechaFabr, CantAsientos, Estado) Values ('LLL800', 1995, 17/2/1990, 60, 'A')
go
insert into TerminalesOrigen (CodTerminal, NomTerminal, Estado) Values ('1111','Pacheco - Tigre', 'A')
go
insert into TerminalesOrigen (CodTerminal, NomTerminal, Estado) Values ('2222','Corrientes Capital', 'A')
go
insert into TerminalesOrigen (CodTerminal, NomTerminal, Estado) Values ('3333','La Plata', 'A')
go
insert into TerminalesDestino (CodTerminal, NomTerminal, Estado) Values ('1111','Pacheco - Tigre', 'A')
go
insert into TerminalesDestino (CodTerminal, NomTerminal, Estado) Values ('2222','Corrientes Capital', 'A')
go
insert into TerminalesDestino (CodTerminal, NomTerminal, Estado) Values ('3333','La Plata', 'A')
go
insert into Usuarios (CodUsuario, TipoUsuario, Email, Sexo, FechaReg, FechaNac, Estado, Clave) Values ('100', 'Administrador', 'carlostrejo@gmail.com', 'Masculino',24/07/2020 , 01/01/1989 , 'A', 'asds7854')
go
insert into Usuarios (CodUsuario, TipoUsuario, Email, Sexo, FechaReg, FechaNac, Estado, Clave) Values ('200', 'Vendedor', 'nestorrusso@gmail.com', 'Masculino',21/07/2020 , 01/01/1980 , 'A', 'asdcds7834554')
go
insert into Usuarios (CodUsuario, TipoUsuario, Email, Sexo, FechaReg, FechaNac, Estado, Clave) Values ('100', 'Test', 'pipogandulfo@gmail.com', 'Trans',10/06/2020 , 08/12/1999 , 'A', 'asds7854')
go
insert into Viajes (IdTerminalOrigen, IdMicro, IdChofer, FechaViaje, Precio, CodViaje, IdTerminalDestino) Values (1, 1, 1, 24/07/2020 , 5000 , 'SSS345', 2)
go
insert into Viajes (IdTerminalOrigen, IdMicro, IdChofer, FechaViaje, Precio, CodViaje, IdTerminalDestino) Values (2, 1, 1, 18/07/2020 , 6000 , 'SSS100', 1)
go
insert into Viajes (IdTerminalOrigen, IdMicro, IdChofer, FechaViaje, Precio, CodViaje, IdTerminalDestino) Values (3, 2, 1, 19/07/2020 , 9000 , 'PPP100', 1)
go
insert into Pasajes (CodBoleto,IdViaje,CantBoletos,TotalPrecio) Values (1,1,2,4874)
go
insert into Pasajes (CodBoleto,IdViaje,CantBoletos,TotalPrecio) Values (2,2,2,4879)
go
insert into Pasajes (CodBoleto,IdViaje,CantBoletos,TotalPrecio) Values (3,3,3,10250)
go

--Vista
--(permite elaborar un reporte que puede visualizarse en el sistema)
create view [dbo].[VW_ReporteViajes]
as
select V.ID, V.CodViaje, D.NomTerminal as NombreDestino, O.NomTerminal as NombreOrigen, C.Legajo as LegajoChofer, C.Apellidos, M.Patente, V.FechaViaje, V.Precio 
from Viajes V 
inner join Choferes C on V.IdChofer = C.ID 
inner join Micros M on V.IdMicro = M.ID
inner join TerminalesOrigen O on V.IdTerminalOrigen = O.ID 
inner join TerminalesDestino D on V.IdTerminalDestino = D.ID
GO

--Procedimientos Almacenados

--(permite elaborar un reporte que puede visualizarse en el sistema)
CREATE procedure [dbo].[SP_ViajesDeChofer](
@IdChofer int)
as
BEGIN
select C.Apellidos,C.Nombres, V.CodViaje, V.FechaViaje, TDO.NomTerminal as Origen, TDD.NomTerminal as Destino from Viajes as V
inner join Choferes as C on V.IdChofer = C.ID
inner join TerminalesOrigen as TDO on V.IdTerminalOrigen=TDO.ID
inner join TerminalesDestino as TDD on V.IdTerminalDestino=TDD.ID
where C.ID=@IdChofer
END
GO



create procedure [dbo].[SP_AveriguarPrecioViaje]
@idViaje int
as
Select Precio from Viajes where ID = @idViaje 
GO


-- (permite ejecutar una acción en el sistema)
CREATE PROCEDURE [dbo].[SP_BajaChofer]
@idChofer int
AS
BEGIN
UPDATE Choferes SET Estado = 'N'
where ID=@idChofer
END
GO


CREATE procedure [dbo].[SP_BajaMicro]
@IdMicro int
as
update Micros set Estado = 'N' where ID = @IdMicro  
GO


CREATE procedure [dbo].[SP_BajaTerminal]
@Id int
as
update TerminalesOrigen set Estado = 'N' where ID = @Id  
GO


create procedure [dbo].[SP_BajaTerminalDestino]
@Id int
as
update TerminalesDestino set Estado = 'N' where ID = @Id  
GO

create procedure [dbo].[SP_BajaUsuario]
@Id int
as
update Usuarios set Estado = 'N' where ID = @Id  
GO

create procedure [dbo].[SP_ModificarChofer] 
@ID int,
@Legajo int,  
@Apellidos varchar (100),
@Nombres varchar (100),
@Sexo varchar (50),
@FechaNac datetime,
@Estado char(1)
as
begin
update Choferes 
set Legajo = @Legajo,
	Apellidos = @Apellidos,
	Nombres =  @Nombres,
	Sexo = @Sexo,
	FechaNac = @FechaNac,
	Estado = @Estado
	where ID=@ID 
end
GO

create procedure [dbo].[SP_ModificarMicro]
@Id int,
@Patente varchar(100),
@Modelo int,
@FechaFabr datetime,
@CantAsientos int,
@Estado char(1)
as
begin
update Micros 
set Patente = @Patente,
	Modelo = @Modelo,
	FechaFabr = @FechaFabr,
	CantAsientos = @CantAsientos,
	Estado = @Estado
	where ID = @Id
end
GO

CREATE procedure [dbo].[SP_ModificarTerminalOrigen]
@Id int,
@CodTerminal varchar(50),
@NomTerminal varchar(100),
@Estado char(1)
as
begin
update TerminalesOrigen 
set CodTerminal = @CodTerminal,
	NomTerminal = @NomTerminal,
	Estado = @Estado
	where ID = @Id
end
GO

create procedure [dbo].[SP_ModificarTerminalDestino]
@Id int,
@CodTerminal varchar(50),
@NomTerminal varchar(100),
@Estado char(1)
as
begin
update TerminalesDestino 
set CodTerminal = @CodTerminal,
	NomTerminal = @NomTerminal,
	Estado = @Estado
	where ID = @Id
end
GO

create procedure [dbo].[SP_ModificarUsuario]
@Id int,
@CodUsuario varchar(50),
@TipoUsuario varchar(50),
@Email varchar(100),
@Sexo varchar(50),
@FechaReg datetime,
@FechaNac datetime,
@Estado char(1),
@Clave varchar(100)
as
begin
update Usuarios 
set CodUsuario = @CodUsuario,
	TipoUsuario = @TipoUsuario,
	Email = @Email,
	Sexo = @Sexo,
	FechaReg = @FechaReg,
	FechaNac = @FechaNac,
	Estado = @Estado,
	Clave = @Clave
	where ID = @Id
end
	
GO








