# LENS-Assignment

### Prerequisites
 Before starting, ensure the following tools, services, and configurations are ready:

- Azure Account: To use Azure services such as AKS and ACR.
- Azure Service Principal: For secure access to Azure resources.
- Azure CLI: Installed locally or you can use from azure portal as well for managing Azure resources.
- Docker Hub Account: for storing Docker images.
- GitHub Repository: Where your code is stored and configured with GitHub Actions.
- Slack: Create a slack account to receive builds notification

### Store credentials in the Repository Secrets

- Go to repository setting
- Under secrets and variables, select Actions
- Scroll down and click on new repository secret
- Add all the required username and password

After saving, it should look like before

![repository secret](image.png)

Create package.json file to install all the dependencies

### Setting up Azure service principal
 In order to access the Azure portal resporces, we would be needing Azure service principal

 - Open Azure cloud shell
 - Run the below command to create Service Principal and generate credentials:
 ```bash
    az ad sp create-for-rbac --name "github-actions-sp" --role contributor --scopes /subscriptions/{subscription-id} --sdk-auth
```
Here, we have to replace the {subscription-id} with our subscription-id

