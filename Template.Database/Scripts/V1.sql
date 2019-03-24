﻿/*
	This is a deployment script for the Template.MVC application.
	It contains lookups and the creation of an admin user which you can configure below

	The configured password hash is done via the BCrypt library which is used in this template
*/

DECLARE @AdminUsername VARCHAR(50) = 'admin',
		@AdminEmailAddress VARCHAR(50) = 'admin@example.com',
		@AdminFirstName VARCHAR(50) = 'Admin',
		@AdminPasswordHash VARCHAR(50) = '$2a$11$gtuEiRe1d3pRs37gieG3bu1sLzlD1LRwKKQd0W8ks8nvKDacIv05O', -- 123456
		@AdminUserId INT; -- used for assigning roles at the bottom

--add system user
INSERT INTO [User]
([Username], [Email_Address], [Registration_Confirmed], [First_Name], [Password_Hash], [Is_Enabled], [Created_By], [Created_Date], [Updated_By], [Updated_Date])
VALUES ('system', 'system@example.com', 1, 'System', 'this-password-will-never-work', 1, NULL, GETDATE(), NULL, GETDATE())

INSERT INTO [User]
([Username], [Email_Address], [Registration_Confirmed], [First_Name], [Password_Hash], [Is_Enabled], [Created_By], [Created_Date], [Updated_By], [Updated_Date])
VALUES (@AdminUsername, @AdminEmailAddress, 1, @AdminFirstName, @AdminPasswordHash, 1, NULL, GETDATE(), NULL, GETDATE())

SET @AdminUserId = SCOPE_IDENTITY();

--add session events
INSERT INTO [Session_Event]
([Key], [Description], [Created_By], [Created_Date], [Updated_By], [Updated_Date])
VALUES ('USER_LOGGED_IN', 'User has signed in', 1, GETDATE(), 1, GETDATE())

INSERT INTO [Session_Event]
([Key], [Description], [Created_By], [Created_Date], [Updated_By], [Updated_Date])
VALUES ('USER_UPDATED_PROFILE', 'User has updated their profile', 1, GETDATE(), 1, GETDATE())

INSERT INTO [Session_Event]
([Key], [Description], [Created_By], [Created_Date], [Updated_By], [Updated_Date])
VALUES ('ERROR', 'An exception occurred', 1, GETDATE(), 1, GETDATE())

INSERT INTO [Session_Event]
([Key], [Description], [Created_By], [Created_Date], [Updated_By], [Updated_Date])
VALUES ('USER_REGISTERED', 'User has registered', 1, GETDATE(), 1, GETDATE())

INSERT INTO [Session_Event]
([Key], [Description], [Created_By], [Created_Date], [Updated_By], [Updated_Date])
VALUES ('CLAIM_CREATED', 'Claim has been created', 1, GETDATE(), 1, GETDATE())

INSERT INTO [Session_Event]
([Key], [Description], [Created_By], [Created_Date], [Updated_By], [Updated_Date])
VALUES ('SESSION_EVENT_CREATED', 'Session event has been created', 1, GETDATE(), 1, GETDATE())

INSERT INTO [Session_Event]
([Key], [Description], [Created_By], [Created_Date], [Updated_By], [Updated_Date])
VALUES ('CLAIM_UPDATED', 'Claim has been updated', 1, GETDATE(), 1, GETDATE())

INSERT INTO [Session_Event]
([Key], [Description], [Created_By], [Created_Date], [Updated_By], [Updated_Date])
VALUES ('CONFIGURATION_CREATED', 'Configuration item has been created', 1, GETDATE(), 1, GETDATE())

INSERT INTO [Session_Event]
([Key], [Description], [Created_By], [Created_Date], [Updated_By], [Updated_Date])
VALUES ('CONFIGURATION_UPDATED', 'Configuration item has been updated', 1, GETDATE(), 1, GETDATE())

INSERT INTO [Session_Event]
([Key], [Description], [Created_By], [Created_Date], [Updated_By], [Updated_Date])
VALUES ('ROLES_CLAIMS_UPDATED', 'Role claims have been updated', 1, GETDATE(), 1, GETDATE())

INSERT INTO [Session_Event]
([Key], [Description], [Created_By], [Created_Date], [Updated_By], [Updated_Date])
VALUES ('ROLE_CREATED', 'Role has been created', 1, GETDATE(), 1, GETDATE())

INSERT INTO [Session_Event]
([Key], [Description], [Created_By], [Created_Date], [Updated_By], [Updated_Date])
VALUES ('ROLE_UPDATED', 'Role has been updated', 1, GETDATE(), 1, GETDATE())

INSERT INTO [Session_Event]
([Key], [Description], [Created_By], [Created_Date], [Updated_By], [Updated_Date])
VALUES ('ROLE_DISABLED', 'Role has been disabled', 1, GETDATE(), 1, GETDATE())

INSERT INTO [Session_Event]
([Key], [Description], [Created_By], [Created_Date], [Updated_By], [Updated_Date])
VALUES ('ROLE_ENABLED', 'Role has been enabled', 1, GETDATE(), 1, GETDATE())

INSERT INTO [Session_Event]
([Key], [Description], [Created_By], [Created_Date], [Updated_By], [Updated_Date])
VALUES ('USER_CREATED', 'User has been created', 1, GETDATE(), 1, GETDATE())

INSERT INTO [Session_Event]
([Key], [Description], [Created_By], [Created_Date], [Updated_By], [Updated_Date])
VALUES ('USER_UPDATED', 'User has been updated', 1, GETDATE(), 1, GETDATE())

INSERT INTO [Session_Event]
([Key], [Description], [Created_By], [Created_Date], [Updated_By], [Updated_Date])
VALUES ('USER_DISABLED', 'User has been disabled', 1, GETDATE(), 1, GETDATE())

INSERT INTO [Session_Event]
([Key], [Description], [Created_By], [Created_Date], [Updated_By], [Updated_Date])
VALUES ('USER_ENABLED', 'User has been enabled', 1, GETDATE(), 1, GETDATE())

INSERT INTO [Session_Event]
([Key], [Description], [Created_By], [Created_Date], [Updated_By], [Updated_Date])
VALUES ('USER_ROLES_UPDATED', 'User roles have been updated', 1, GETDATE(), 1, GETDATE())

INSERT INTO [Session_Event]
([Key], [Description], [Created_By], [Created_Date], [Updated_By], [Updated_Date])
VALUES ('SESSION_EVENT_UPDATED', 'Session event has been updated', 1, GETDATE(), 1, GETDATE())


--add configuration
INSERT INTO [Configuration]
([Key], [Description], [Boolean_Value], [DateTime_Value], [Decimal_Value], [Int_Value], [Money_Value], [String_Value], [Created_By], [Created_Date], [Updated_By], [Updated_Date])
VALUES ('SESSION_LOGGING_IS_ENABLED', 'Feature switch for session and event tracking', 1, NULL, NULL, NULL, NULL, NULL, 1, GETDATE(), 1, GETDATE())

INSERT INTO [Configuration]
([Key], [Description], [Boolean_Value], [DateTime_Value], [Decimal_Value], [Int_Value], [Money_Value], [String_Value], [Created_By], [Created_Date], [Updated_By], [Updated_Date])
VALUES ('HOME_PROMO_BANNER_IS_ENABLED', 'Feature switch for a promotional banner on the home page', 1, NULL, NULL, NULL, NULL, NULL, 1, GETDATE(), 1, GETDATE())


--add claims
INSERT INTO [Claim]
([Key], [Group_Name], [Name], [Description], [Created_By], [Created_Date], [Updated_By], [Updated_Date])
VALUES ('SESSIONS_VIEW', 'Sessions', 'View sessions', 'View user''s sessions', 1, GETDATE(), 1, GETDATE())

INSERT INTO [Claim]
([Key], [Group_Name], [Name], [Description], [Created_By], [Created_Date], [Updated_By], [Updated_Date])
VALUES ('USERS_MANAGE', 'Admin', 'Manage users', 'Create, edit and view users', 1, GETDATE(), 1, GETDATE())

INSERT INTO [Claim]
([Key], [Group_Name], [Name], [Description], [Created_By], [Created_Date], [Updated_By], [Updated_Date])
VALUES ('ROLES_MANAGE', 'Admin', 'Manage roles', 'Create, edit and moderate roles', 1, GETDATE(), 1, GETDATE())

INSERT INTO [Claim]
([Key], [Group_Name], [Name], [Description], [Created_By], [Created_Date], [Updated_By], [Updated_Date])
VALUES ('CLAIMS_MANAGE', 'Admin', 'Manage claims', 'Create and edit claims', 1, GETDATE(), 1, GETDATE())

INSERT INTO [Claim]
([Key], [Group_Name], [Name], [Description], [Created_By], [Created_Date], [Updated_By], [Updated_Date])
VALUES ('SESSION_EVENTS_MANAGE', 'Admin', 'Manage session events', 'Create and edit session events', 1, GETDATE(), 1, GETDATE())

INSERT INTO [Claim]
([Key], [Group_Name], [Name], [Description], [Created_By], [Created_Date], [Updated_By], [Updated_Date])
VALUES ('CONFIGURATION_MANAGE', 'Admin', 'Manage configuration', 'Create and edit configuration items', 1, GETDATE(), 1, GETDATE())

INSERT INTO [Claim]
([Key], [Group_Name], [Name], [Description], [Created_By], [Created_Date], [Updated_By], [Updated_Date])
VALUES ('ADMIN_VIEW', 'Admin', 'Readonly admin view', 'View the admin section of the website', 1, GETDATE(), 1, GETDATE())

--add roles
INSERT INTO [Role]
([Name], [Description], [Is_Enabled], [Created_By], [Created_Date], [Updated_By], [Updated_Date])
VALUES ('Admin', 'Administrator account', 1, 1, GETDATE(), 1, GETDATE())

--add role claims
INSERT INTO [Role_Claim]
([Role_Id], [Claim_Id], Created_By, [Created_Date], [Updated_By], [Updated_Date])
SELECT 1, [Id] AS [Claim_Id], 1, GETDATE(), 1, GETDATE()
FROM [Claim]

--add add user role
INSERT INTO [User_Role]
([User_Id], [Role_Id], Created_By, [Created_Date], [Updated_By], [Updated_Date])
SELECT @AdminUserId AS [User_Id], [Id] AS [Role_Id], 1, GETDATE(), 1, GETDATE()
FROM [Role]