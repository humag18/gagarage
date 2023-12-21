USE [master]
GO

/****** Object:  Audit [Audit-TravauxSQL-Admin&Directeur]    Script Date: 22/12/2022 02:52:41 ******/
CREATE SERVER AUDIT [Audit-TravauxSQL-Admin&Directeur]
TO FILE 
(	FILEPATH = N'D:\Audit\'
	,MAXSIZE = 0 MB
	,MAX_ROLLOVER_FILES = 2147483647
	,RESERVE_DISK_SPACE = OFF
) WITH (QUEUE_DELAY = 1000, ON_FAILURE = CONTINUE, AUDIT_GUID = 'aaceeb8d-5a9c-42f7-83d2-df2d2570f126')
ALTER SERVER AUDIT [Audit-TravauxSQL-Admin&Directeur] WITH (STATE = ON)
GO

