-- Invitations, Members, Clients Stored Procedures
GO

CREATE PROCEDURE [dbo].[SP_GetInvitationsByProjectID]
    @ProjectID INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

  
        
    IF NOT EXISTS (SELECT 1 FROM Projects WHERE ID = @ProjectID)
    BEGIN
        RAISERROR('Project ID is invalid.', 16, 1);
        RETURN;
    END

    BEGIN TRANSACTION
        BEGIN TRY

        SELECT * FROM VW_InvitationProject
        WHERE ProjectID = @ProjectID
        ORDER BY PublishedAt DESC
            COMMIT TRANSACTION
        END TRY

        BEGIN CATCH
            IF @@TRANCOUNT > 0
                ROLLBACK TRANSACTION
            
            SELECT 
                @ErrorMessage = ERROR_MESSAGE(),
                @ErrorSeverity = ERROR_SEVERITY(),
                @ErrorState = ERROR_STATE();
            
            RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
        
        END CATCH
END
GO

CREATE PROCEDURE [dbo].[SP_GetInvitationsByInvitationID]
    @InvitationID INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

   
        
    IF NOT EXISTS (SELECT 1 FROM Invitations WHERE ID = @InvitationID)
    BEGIN
        RAISERROR('Project ID is invalid.', 16, 1);
        RETURN;
    END

    BEGIN TRANSACTION
        BEGIN TRY

        SELECT * FROM VW_Invitation
        WHERE ID = @InvitationID

            COMMIT TRANSACTION
        END TRY

        BEGIN CATCH
            IF @@TRANCOUNT > 0
                ROLLBACK TRANSACTION
            
            SELECT 
                @ErrorMessage = ERROR_MESSAGE(),
                @ErrorSeverity = ERROR_SEVERITY(),
                @ErrorState = ERROR_STATE();
            
            RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
        
        END CATCH
END
GO
CREATE PROCEDURE [dbo].[SP_GetTeamMembersByProjectID]
    @ProjectID INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

  
        
    IF NOT EXISTS (SELECT 1 FROM Projects WHERE ID = @ProjectID)
    BEGIN
        RAISERROR('Project ID is invalid.', 16, 1);
        RETURN;
    END

    BEGIN TRANSACTION
        BEGIN TRY

        SELECT * FROM VW_MemberProject
        WHERE ProjectID = @ProjectID
        
            COMMIT TRANSACTION
        END TRY

        BEGIN CATCH
            IF @@TRANCOUNT > 0
                ROLLBACK TRANSACTION
            
            SELECT 
                @ErrorMessage = ERROR_MESSAGE(),
                @ErrorSeverity = ERROR_SEVERITY(),
                @ErrorState = ERROR_STATE();
            
            RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
        
        END CATCH
END
GO
CREATE PROCEDURE [dbo].[SP_GetTeamMemberByMemberID]
    @MemberID INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

   
        
    IF NOT EXISTS (SELECT 1 FROM Members WHERE ID = @MemberID)
    BEGIN
        RAISERROR('Member ID is invalid.', 16, 1);
        RETURN;
    END

    BEGIN TRANSACTION
        BEGIN TRY

        SELECT * FROM VW_Member
        WHERE ID = @MemberID

            COMMIT TRANSACTION
        END TRY

        BEGIN CATCH
            IF @@TRANCOUNT > 0
                ROLLBACK TRANSACTION
            
            SELECT 
                @ErrorMessage = ERROR_MESSAGE(),
                @ErrorSeverity = ERROR_SEVERITY(),
                @ErrorState = ERROR_STATE();
            
            RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
        
        END CATCH
END
GO

CREATE PROCEDURE [dbo].[SP_GetClientsByProjectID]
    @ProjectID INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

  
        
    IF NOT EXISTS (SELECT 1 FROM Projects WHERE ID = @ProjectID)
    BEGIN
        RAISERROR('Project ID is invalid.', 16, 1);
        RETURN;
    END

    BEGIN TRANSACTION
        BEGIN TRY

        SELECT * FROM VW_ClientProject
        WHERE ProjectID = @ProjectID
        
            COMMIT TRANSACTION
        END TRY

        BEGIN CATCH
            IF @@TRANCOUNT > 0
                ROLLBACK TRANSACTION
            
            SELECT 
                @ErrorMessage = ERROR_MESSAGE(),
                @ErrorSeverity = ERROR_SEVERITY(),
                @ErrorState = ERROR_STATE();
            
            RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
        
        END CATCH
END
GO
CREATE PROCEDURE [dbo].[SP_GetClientByClientID]
    @ClientID INT
AS
BEGIN
    SET NOCOUNT ON;

    DECLARE @ErrorMessage NVARCHAR(4000);
    DECLARE @ErrorSeverity INT;
    DECLARE @ErrorState INT;

   
        
    IF NOT EXISTS (SELECT 1 FROM Members WHERE ID = @ClientID)
    BEGIN
        RAISERROR('Member ID is invalid.', 16, 1);
        RETURN;
    END

    BEGIN TRANSACTION
        BEGIN TRY

        SELECT * FROM VW_Client
        WHERE ID = @ClientID

            COMMIT TRANSACTION
        END TRY

        BEGIN CATCH
            IF @@TRANCOUNT > 0
                ROLLBACK TRANSACTION
            
            SELECT 
                @ErrorMessage = ERROR_MESSAGE(),
                @ErrorSeverity = ERROR_SEVERITY(),
                @ErrorState = ERROR_STATE();
            
            RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
        
        END CATCH
END
GO