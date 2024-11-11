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

![repository secret](Repository Secret.png)

**Now we have to create package.json file to install all the dependencies**

### Setting up Azure service principal
 In order to access the Azure portal resporces, we would be needing Azure service principal

 - Open Azure cloud shell
 - Run the below command to create Service Principal and generate credentials:
 ```bash
    az ad sp create-for-rbac --name "github-actions-sp" --role contributor --scopes /subscriptions/{subscription-id} --sdk-auth
```
Here, we have to replace the {subscription-id} with our subscription-id

### Setting up slack to receive notification
- After creating an account, select from scratch to build new app
- Select slack workspace where you want to post the message.
- In the app's settings, go to Incoming Webhooks on the left menu and select Activate Incoming Webhooks.
- Click Add New Webhook to Workspace, then choose a channel to post your messages and allow permissions. 
- After this we’ll get a webhook URL that we’ll use in our GitHub Actions workflow.
- Then save the webhook to github repository secrets as above.

**Once done you will see messages like below**

![Slack notification](slack-notification.png)

Once these are setup, we will configure Docker-compose, Kubernetes and Terraform 

Once all the pipeline, required dependencies are setup
