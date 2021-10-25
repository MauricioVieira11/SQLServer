create table Planetas(
    IdPlaneta int not null,
    Nome varchar(50) not null,
    Rotacao FLOAT not null,
    Orbita FLOAT  not null,
    Diametro FLOAT not null,
    Clima VARCHAR(50) not null,
    Populacao int NOT NULL,
)
go
alter table Planetas Add CONSTRAINT PK_PLANETAS PRIMARY KEY (IdPLaneta);

create table Naves(
    IdNave int not null,
    Nome VARCHAR(100) not null,
    Modelo VARCHAR(150) not null,
    Passageiros int not NULL,
    Carga FLOAT NOT NULL,
    Classe VARCHAR(100)
)
go
alter table Naves add constraint pk_Naves primary key (IdNave);

create table Pilotos(
    IdPiloto int not null,
    Nome VARCHAR(200) not null,
    AnoNascimento VARCHAR(10) not null,
    IdPlaneta int Not NULL,
)
go
Alter table Pilotos Add constraint pk_pilotos primary key (IdPiloto);
go
alter table Pilotos add CONSTRAINT FK_Pilotos_Planetas FOREIGN KEY(IdPlaneta)
REFERENCES Planetas (IdPlaneta);

CREATE table PilotosNaves(
    IdPiloto int not null,
    IdNave int not null,
    FlagAutorizado bit not null,
)
go 
alter table PilotosNaves add constraint pk_pilotosNaves primary key (IdPiloto, IdNave);
GO
alter table PilotosNaves add CONSTRAINT fk_PilotosNaves_pilotos FOREIGN key(IdPiloto)
REFERENCES Pilotos (IdPiloto)
go
alter table PilotosNaves add CONSTRAINT fk_PilotosNaves_Naves FOREIGN key (IdNave)
REFERENCES Naves (IdNave)
go
alter table PilotosNaves add CONSTRAINT Df_Pilotos_Naves_FlagAutorizado DEFAULT (1) FOR FlagAutorizado;

create table HistoricoViagens(
    IdNave int not null,
    IdPiloto int not null,
    DtSaida DATETIME not null,
    DtChegada DATETIME null
)
go
alter table HistoricoViagens add constraint fk_HistoricoViagens_PilotosNaves FOREIGN key(IdPiloto, IdNave)
REFERENCES PilotosNaves (IdPiloto, IdNave)
go
alter table HistoricoViagens check Constraint Fk_HistoricoViagens_PilotosNaves;
