USE [Basecamp]
GO
/****** Object:  StoredProcedure [dbo].[SP_GetCardsByColumnID]    Script Date: 1/18/2026 11:25:06 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SP_GetCardsByColumnID]
    @ColumnID INT,
    @MemberOrClient BIT
AS 
BEGIN
    SET NOCOUNT ON;
    IF @ColumnID IS NULL 
    BEGIN 
        RAISERROR('ColumnID is required', 16, 1) 
        RETURN 
    END
    IF NOT EXISTS (SELECT 1 FROM dbo.Columns WHERE ID = @ColumnID) 
    BEGIN 
        RAISERROR('Invalid ColumnID. Column does not exist.', 16, 1) 
        RETURN 
    END

    IF @MemberOrClient = 1
    BEGIN
        SELECT * FROM VW_CardViewByColumnID 
        WHERE ColumnID = @ColumnID
        ORDER BY PublishedAt DESC
    END
    ELSE
    BEGIN
        SELECT * FROM VW_CardViewByColumnID 
        WHERE ColumnID = @ColumnID AND IsPrivate = 0
        ORDER BY PublishedAt DESC
    END
END
GO

USE [Basecamp]
GO
/****** Object:  StoredProcedure [dbo].[SP_GetChatByProjectID]    Script Date: 1/18/2026 11:25:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 9. Get Chat By ProjectID
ALTER PROCEDURE [dbo].[SP_GetChatByProjectID]
    @ProjectID INT,
    @MemberOrClient BIT
AS
BEGIN
    SET NOCOUNT ON;
    IF @ProjectID IS NULL BEGIN RAISERROR('ProjectID is required', 16, 1) RETURN END
    IF NOT EXISTS (SELECT 1 FROM dbo.Projects WHERE ID = @ProjectID) BEGIN RAISERROR('Invalid ProjectID. Project does not exist.', 16, 1) RETURN END

    IF @MemberOrClient = 1
    BEGIN
        SELECT * FROM VW_ChatViewByProjectID 
        WHERE ProjectID = @ProjectID
        ORDER BY PublishedAt DESC
    END
    ELSE
    BEGIN
        SELECT * FROM VW_ChatViewByProjectID 
        WHERE ProjectID = @ProjectID AND IsPrivate = 0
        ORDER BY PublishedAt DESC
    END
END
GO

USE [Basecamp]
GO
/****** Object:  StoredProcedure [dbo].[SP_GetDocumentByProjectID]    Script Date: 1/18/2026 11:26:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 8. Get Document By ProjectID
ALTER PROCEDURE [dbo].[SP_GetDocumentByProjectID]
    @ProjectID INT,
    @MemberOrClient BIT
AS
BEGIN
    SET NOCOUNT ON;
    IF @ProjectID IS NULL BEGIN RAISERROR('ProjectID is required', 16, 1) RETURN END
    IF NOT EXISTS (SELECT 1 FROM dbo.Projects WHERE ID = @ProjectID) BEGIN RAISERROR('Invalid ProjectID. Project does not exist.', 16, 1) RETURN END

    IF @MemberOrClient = 1
    BEGIN
        SELECT * FROM VW_DocumentViewByProjectID 
        WHERE ProjectID = @ProjectID
    END
    ELSE
    BEGIN
        SELECT * FROM VW_DocumentViewByProjectID 
        WHERE ProjectID = @ProjectID AND IsPrivate = 0
    END
END
GO

USE [Basecamp]
GO
/****** Object:  StoredProcedure [dbo].[SP_GetListByProjectID]    Script Date: 1/18/2026 11:26:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 4. Get List By ProjectID
ALTER PROCEDURE [dbo].[SP_GetListByProjectID]
    @ProjectID INT,
    @MemberOrClient BIT
AS
BEGIN
    SET NOCOUNT ON;
    IF @ProjectID IS NULL BEGIN RAISERROR('ProjectID is required', 16, 1) RETURN END
    IF NOT EXISTS (SELECT 1 FROM dbo.Projects WHERE ID = @ProjectID) BEGIN RAISERROR('Invalid ProjectID. Project does not exist.', 16, 1) RETURN END

    IF @MemberOrClient = 1
    BEGIN
        SELECT * FROM VW_ListViewByProjectID 
        WHERE ProjectID = @ProjectID
    END
    ELSE
    BEGIN
        SELECT * FROM VW_ListViewByProjectID 
        WHERE ProjectID = @ProjectID AND IsPrivate = 0
    END
END
GO

USE [Basecamp]
GO
/****** Object:  StoredProcedure [dbo].[SP_GetMessageBoardByProjectID]    Script Date: 1/18/2026 11:27:02 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 2. Get MessageBoard By ProjectID
ALTER PROCEDURE [dbo].[SP_GetMessageBoardByProjectID]
    @ProjectID INT,
    @MemberOrClient BIT
AS
BEGIN
    SET NOCOUNT ON;
    IF @ProjectID IS NULL BEGIN RAISERROR('ProjectID is required', 16, 1) RETURN END
    IF NOT EXISTS (SELECT 1 FROM dbo.Projects WHERE ID = @ProjectID) BEGIN RAISERROR('Invalid ProjectID. Project does not exist.', 16, 1) RETURN END

    IF @MemberOrClient = 1
    BEGIN
        SELECT * FROM VW_MessageBoardByProjectID 
        WHERE ProjectID = @ProjectID
        ORDER BY PublishedAt DESC
    END
    ELSE
    BEGIN
        SELECT * FROM VW_MessageBoardByProjectID 
        WHERE ProjectID = @ProjectID AND IsPrivate = 0
        ORDER BY PublishedAt DESC
    END
END
GO

USE [Basecamp]
GO
/****** Object:  StoredProcedure [dbo].[SP_GetQuestionByProjectID]    Script Date: 1/18/2026 11:27:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- 13. Get Question By ProjectID
ALTER PROCEDURE [dbo].[SP_GetQuestionByProjectID]
    @ProjectID INT,
    @MemberOrClient BIT
AS
BEGIN
    SET NOCOUNT ON;
    IF @ProjectID IS NULL BEGIN RAISERROR('ProjectID is required', 16, 1) RETURN END
    IF NOT EXISTS (SELECT 1 FROM dbo.Projects WHERE ID = @ProjectID) BEGIN RAISERROR('Invalid ProjectID. Project does not exist.', 16, 1) RETURN END

    IF @MemberOrClient = 1
    BEGIN
        SELECT * FROM VW_QuestionViewByProjectID 
        WHERE ProjectID = @ProjectID
    END
    ELSE
    BEGIN
        SELECT * FROM VW_QuestionViewByProjectID 
        WHERE ProjectID = @ProjectID AND IsPrivate = 0
    END
END
GO
