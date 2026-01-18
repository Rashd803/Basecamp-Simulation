
-- Invitations, Teem Members, Clients VIEWS

-- Invitation VIEWS
-- 1:
ALTER VIEW VW_InvitationProject AS
SELECT 
I.ID AS InvitationID,
I.TheInvitedName,
P.PublishedAt,
InvitStat.Name,
I.ProjectID

FROM Invitations AS I
INNER JOIN
PublishingInformation AS P ON I.PublishingInfoID = P.ID
INNER JOIN 
InvitationStatuses AS InvitStat ON I.StatusID = InvitStat.ID
GO
-- 2:
ALTER VIEW VW_Invitation AS
SELECT 
I.ID AS InvitationID,
I.TheInvitedName,
I.Email,
I.Text,
I.JobTitle,
I.CompanyName,
P.PublishedAt,
U.Name AS InviterName,
InvitStat.Name

FROM Invitations AS I
INNER JOIN
PublishingInformation AS P ON I.PublishingInfoID = P.ID
INNER JOIN 
InvitationStatuses AS InvitStat ON I.StatusID = InvitStat.ID
INNER JOIN 
Members AS M ON P.PublisherID = M.ID
INNER JOIN
Users AS U ON M.UserID = U.ID
GO

-- Member VIEWS
-- 1:
ALTER VIEW VW_MemberProject AS
SELECT
M.ID AS MemberID,
U.Name AS MemberName,
U.CompanyName,
A.ProjectID

FROM Members AS M
INNER JOIN
Users AS U ON M.UserID = U.ID
INNER JOIN
Assignments AS A ON M.ID = A.MemberID
GO
-- 2:
ALTER VIEW VW_Member AS
SELECT
M.ID AS MemberID,
U.Name AS MemberName,
U.CompanyName

FROM Members AS M
INNER JOIN
Users AS U ON M.UserID = U.ID

GO

-- Client VIEWS
-- 1:

ALTER VIEW VW_ClientProject AS
SELECT
C.ID AS ClientID,
U.Name AS ClientName,
U.CompanyName,
A.ProjectID

FROM Clients AS C
INNER JOIN
Users AS U ON C.UserID = U.ID
INNER JOIN
Assignments AS A ON C.ID = A.ClientID

GO

-- 2:

ALTER VIEW VW_Client AS
SELECT
C.ID AS ClientID,
U.Name AS ClientName,
U.CompanyName,
U.JobTitle,
U.Email


FROM Clients AS C
INNER JOIN
Users AS U ON C.UserID = U.ID
INNER JOIN
Assignments AS A ON C.ID = A.ClientID
