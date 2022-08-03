# Set up Azure Active Directory and add sign-in to a desktop application

This is to provide some tutorial web pages to add Azure AD sign-in to a desktop application via Azure Portal (, not via Terraform yet).

1. Read [Quickstart: Create a new tenant in Azure Active Directory](https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/active-directory-access-create-new-tenant) to create a new tenant in the existing Azure Active Directory.
2. Read [Add or delete users using Azure Active Directory](https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/add-users-azure-active-directory) to create new users.
3. Read [Use the Microsoft Graph API](https://docs.microsoft.com/en-us/graph/use-the-api) and [How can I change default tenant in Microsoft Graph Explorer](https://stackoverflow.com/questions/53341544/how-can-i-change-default-tenant-in-microsoft-graph-explorer) to use Microsoft Graph API to list all users in the tenant.
   - On the Graph Explorer, you may need to consent to the permission on Modify permissions tab.
4. Read [Using the Microsoft identity platform to call Microsoft Graph API from a multi-target console application](https://github.com/Azure-Samples/ms-identity-dotnet-desktop-tutorial/tree/master/1-Calling-MSGraph/1-1-AzureAD) to set up and try the sign-in.
   - Remember to modify [appsettings.json](./desktop/Console-Interactive-MultiTarget/appsettings.json), as mentioned in the quick start guide.
   - Check [Program.cs](./desktop/Console-Interactive-MultiTarget/Program.cs) to see how to get user information via Microsoft Graph API.
   - After the application is run,
      - If Chrome or Edge browser is your default web browser, the currently Windows log-in account will be used if it is a valid one.
      - If Firefox browser is your default web browser, you can log in with other user account.

## References

- [From the Implicit flow to PKCE: A look at OAuth 2.0 in SPAs](https://pragmaticwebsecurity.com/articles/oauthoidc/from-implicit-to-pkce.html)
- [What is the Microsoft identity platform?](https://docs.microsoft.com/en-us/azure/active-directory/develop/v2-overview)
- [Getting started with MSAL.NET](https://github.com/AzureAD/microsoft-authentication-library-for-dotnet/wiki)
- [Getting started with MSAL.JS](https://github.com/AzureAD/microsoft-authentication-library-for-js/wiki)
