USE [examen_monopharma]
GO

CREATE DATABASE AUDIT SPECIFICATION [Audit-SELECTmonopharma-1]
FOR SERVER AUDIT [Audit-SELECTmonopharma]
ADD (SELECT ON DATABASE::[examen_monopharma] BY [public])
WITH (STATE = ON)
GO

