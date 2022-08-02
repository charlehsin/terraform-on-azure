# Set up Azure Active Directory and add sign-in to a SPA using authorization code flow

This is to provide some tutorial web pages to add Azure AD sign-in to a SPA via Azure Portal.

1. Read [Quickstart: Create a new tenant in Azure Active Directory](https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/active-directory-access-create-new-tenant) to create a new tenant in the existing Azure Active Directory.
2. Read [Add or delete users using Azure Active Directory](https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/add-users-azure-active-directory) to create new users.
3. Read [Use the Microsoft Graph API](https://docs.microsoft.com/en-us/graph/use-the-api) and [How can I change default tenant in Microsoft Graph Explorer](https://stackoverflow.com/questions/53341544/how-can-i-change-default-tenant-in-microsoft-graph-explorer) to use Microsoft Graph API to list all users in the tenant.
   - On the Graph Explorer, you may need to consent to the permission on Modify permissions tab.
4. Read [Microsoft identity platform and OAuth 2.0 authorization code flow](https://docs.microsoft.com/en-us/azure/active-directory/develop/v2-oauth2-auth-code-flow) to understand the authorization code flow.
5. Read [Quickstart: Sign in users in single-page apps (SPA) via the auth code flow](https://docs.microsoft.com/en-us/azure/active-directory/develop/single-page-app-quickstart?pivots=devlang-react) to set up and try the sign-in.
   - Remember to modify [authConfig.js](./react-spa/src/authConfig.js), as mentioned in the quick start guide.
   - After the SPA is started,
      - If Chrome or Edge browser is used, the currently Windows log-in account will be used if it is a valid one.
      - If Firefox browser is used, you can log in with other user account.
