﻿namespace Template.Infrastructure.Session
{
    /// <summary>
    /// These constants map to the [Key] field of each session event item
    /// </summary>
    public class SessionEventKeys
    {
        public const string Error = "ERROR";
        public const string UserLoggedIn = "USER_LOGGED_IN";
        public const string UserRegistered = "USER_REGISTERED";
        public const string UserUpdatedProfile = "USER_UPDATED_PROFILE";
        public const string ClaimCreated = "CLAIM_CREATED";
        public const string ClaimUpdated = "CLAIM_UPDATED";
        public const string ConfigurationCreated = "CONFIGURATION_CREATED";
        public const string ConfigurationUpdated = "CONFIGURATION_UPDATED";
        public const string RoleClaimsUpdated = "ROLES_CLAIMS_UPDATED";
        public const string RoleCreated = "ROLE_CREATED";
        public const string RoleUpdated = "ROLE_UPDATED";
        public const string RoleDisabled = "ROLE_DISABLED";
        public const string RoleEnabled = "ROLE_ENABLED";
        public const string UserCreated = "USER_CREATED";
        public const string UserUpdated = "USER_UPDATED";
        public const string UserDisabled = "USER_DISABLED";
        public const string UserEnabled = "USER_ENABLED";
        public const string UserRolesUpdated = "USER_ROLES_UPDATED";
        public const string SessionEventCreated = "SESSION_EVENT_CREATED";
        public const string SessionEventUpdated = "SESSION_EVENT_UPDATED";
    }
}