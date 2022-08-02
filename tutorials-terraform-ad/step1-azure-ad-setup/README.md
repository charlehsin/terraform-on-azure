# Set up Azure Active Directory and add sign-in to a web app

This is to provide some tutorial web pages to add Azure AD sign-in to a web app via Azure Portal.

1. Read [Quickstart: Create a new tenant in Azure Active Directory](https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/active-directory-access-create-new-tenant) to create a new tenant in the existing Azure Active Directory.
2. Read [Add or delete users using Azure Active Directory](https://docs.microsoft.com/en-us/azure/active-directory/fundamentals/add-users-azure-active-directory) to create new users.
3. Read [Use the Microsoft Graph API](https://docs.microsoft.com/en-us/graph/use-the-api) and [How can I change default tenant in Microsoft Graph Explorer](https://stackoverflow.com/questions/53341544/how-can-i-change-default-tenant-in-microsoft-graph-explorer) to use Microsoft Graph API to list all users in the tenant.
   - On the Graph Explorer, you may need to consent to the permission on Modify permissions tab.
4. Read[Quickstart: Add sign-in with Microsoft to a web app](https://docs.microsoft.com/en-us/azure/active-directory/develop/web-app-quickstart?pivots=devlang-aspnet-core) to set up and try the sign-in.
   - Remember to modify [appsettings.json](./web-app/appsettings.json), as mentioned in the quick start guide.
   - Check [HomeController.cs](./web-app/Controllers/HomeController.cs) to see how we can show the user information on the web page.
   - After the web app is run in Visual Studio,
      - If Chrome or Edge browser is used, the currently Windows log-in account will be used if it is a valid one.
      - If Firefox browser is used, you can log in with other user account.
