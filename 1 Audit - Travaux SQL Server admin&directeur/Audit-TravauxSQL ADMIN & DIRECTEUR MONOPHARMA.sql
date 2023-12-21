USE [examen_monopharma]
GO

CREATE DATABASE AUDIT SPECIFICATION [Audit-TravauxSQL-Admin&Directeur]
FOR SERVER AUDIT [Audit-TravauxSQL-Admin&Directeur]
ADD (DELETE ON DATABASE::[examen_monopharma] BY [admin]),
ADD (EXECUTE ON DATABASE::[examen_monopharma] BY [admin]),
ADD (INSERT ON DATABASE::[examen_monopharma] BY [admin]),
ADD (SELECT ON DATABASE::[examen_monopharma] BY [admin]),
ADD (DELETE ON DATABASE::[examen_monopharma] BY [directeur]),
ADD (EXECUTE ON DATABASE::[examen_monopharma] BY [directeur]),
ADD (INSERT ON DATABASE::[examen_monopharma] BY [directeur]),
ADD (SELECT ON DATABASE::[examen_monopharma] BY [directeur])
WITH (STATE = ON)
GO

