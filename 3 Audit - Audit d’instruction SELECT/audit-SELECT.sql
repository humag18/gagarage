USE [master]
GO

/****** Object:  Audit [Audit-SELECTmonopharma]    Script Date: 22/12/2022 02:53:24 ******/
CREATE SERVER AUDIT [Audit-SELECTmonopharma]
TO FILE 
(	FILEPATH = N'D:\Audit\'
	,MAXSIZE = 0 MB
	,MAX_ROLLOVER_FILES = 2147483647
	,RESERVE_DISK_SPACE = OFF
) WITH (QUEUE_DELAY = 1000, ON_FAILURE = CONTINUE, AUDIT_GUID = 'cf8f03b3-86f0-4345-89d1-a1c13b6ba1ba')
ALTER SERVER AUDIT [Audit-SELECTmonopharma] WITH (STATE = ON)
GO

