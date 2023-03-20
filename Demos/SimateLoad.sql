USE [StackOverflow2010]
GO

/****** Object:  StoredProcedure [dbo].[SimulatoLoad]    Script Date: 19/03/2023 10:47:02 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

  CREATE OR ALTER PROCEDURE [dbo].[SimulateLoad]
  AS
  BEGIN
		SELECT TOP 1000 * FROM [StackOverflow2010].[dbo].[Users]

		SELECT TOP 1000 * FROM [StackOverflow2010].[dbo].[Users]
		INNER JOIN dbo.Posts On Users.Id = Posts.ParentId

		SELECT TOP 1000 * FROM [StackOverflow2010].[dbo].[Badges]


		SELECT TOP 1000 * FROM [StackOverflow2010].[dbo].[Users]
		WHERE ID = 50 

		SELECT TOP 1000 * FROM [StackOverflow2010].[dbo].[Users]
		WHERE ID = 202 

		SELECT * FROM [StackOverflow2010].[dbo].[Users]
		INNER JOIN dbo.Posts On Users.Id = Posts.ParentId
		WHERE Posts.PostTypeId = ( SELECT TOP 1 PostTypeId FROM dbo.Posts )


  END
GO


EXEC SimulateLoad


-- Now we simulate blocking 
BEGIN TRANSACTION
  SELECT * FROM dbo.Users WITH (TABLOCKX, HOLDLOCK)
    WAITFOR DELAY '00:00:10' -- 10 seconds
ROLLBACK TRANSACTION


EXEC SimulateLoad

-- EXECUTE IN DIFFERENT WINDOW
SELECT * FROM dbo.Users 