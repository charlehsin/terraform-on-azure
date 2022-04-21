# Set up Azure Active Directory B2C

This tutorial is blocked as terraform does not provide enough support for B2C setup yet. Check [Automating Azure AD B2C creation with Terraform](https://codez.deedx.cz/posts/automating-azure-ad-b2c-creation-with-terraform/) for more details.

## Some useful commands

- Run "az account tenant list" to find out the tenant ID.
- Run "az login --tenant target_tenant_id --allow-no-subscriptions" to switch the directory/tenant.

## References

1. [Web sign in with OpenID Connect in Azure Active Directory B2C](https://docs.microsoft.com/en-us/azure/active-directory-b2c/openid-connect)
2. Tutorials
   - [Tutorial: Create an Azure Active Directory B2C tenant](https://docs.microsoft.com/en-us/azure/active-directory-b2c/tutorial-create-tenant)
   - [Tutorial: Register a web application in Azure Active Directory B2C](https://docs.microsoft.com/en-us/azure/active-directory-b2c/tutorial-register-applications?tabs=app-reg-ga)
   - [Tutorial: Create user flows and custom policies in Azure Active Directory B2C - user flows](https://docs.microsoft.com/en-us/azure/active-directory-b2c/tutorial-create-user-flows?pivots=b2c-user-flow)
   - [Tutorial: Create user flows and custom policies in Azure Active Directory B2C - custom policies](https://docs.microsoft.com/en-us/azure/active-directory-b2c/tutorial-create-user-flows?pivots=b2c-custom-policy)
      - Did not finish. Stopped at this step [Custom policy starter pack](https://docs.microsoft.com/en-us/azure/active-directory-b2c/tutorial-create-user-flows?pivots=b2c-custom-policy#custom-policy-starter-pack)
   - [Manage your Azure Active Directory B2C tenant](https://docs.microsoft.com/en-us/azure/active-directory-b2c/tenant-management)
   - [Clean up resources and delete the tenant](https://docs.microsoft.com/en-us/azure/active-directory-b2c/tutorial-delete-tenant)
3. [Azure-Samples: active-directory-b2c-dotnet-webapp-and-webapi](https://github.com/Azure-Samples/active-directory-b2c-dotnet-webapp-and-webapi)
4. [Azure-Samples: active-directory-aspnetcore-webapp-openidconnect-v2](https://github.com/Azure-Samples/active-directory-aspnetcore-webapp-openidconnect-v2/tree/master/1-WebApp-OIDC/1-5-B2C)
5. [GitHub Azure articles](https://github.com/MicrosoftDocs/azure-docs/tree/main/articles/active-directory-b2c)
6. [Automating Azure AD B2C creation with Terraform](https://codez.deedx.cz/posts/automating-azure-ad-b2c-creation-with-terraform/)
