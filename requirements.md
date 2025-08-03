Jenkins CI/CD Pipeline To Deploy Azure Functions
Objective:
The objective of this assignment is to help you understand how to set up a fully functioning CI/CD pipeline using Jenkins, integrated with GitHub as the source control and Azure Functions as the target deployment environment. You will create a sample "Hello World!" function, implement a build, test, and deploy pipeline, and deploy it to Azure Functions.

Total Points: 10%
Grading Criteria:
Jenkins Setup (3%): Proper setup of Jenkins server, integration with GitHub, and pipeline configuration.
Pipeline Stages (3%): Build, Test, and Deploy stages functioning correctly in the Jenkins pipeline.
Test Cases (2%): At least 3 test cases that are executed during the Test stage.
Azure Deployment (2%): Successful deployment to Azure Functions and proper verification.
Prerequisites:
An Azure Account with access to Azure Functions (Use the one provided by Conestoga College or Your Own).
A GitHub Account and repository (Name the repo according to this assignment).
Jenkins Server: Local Jenkins installation that we did as part of the lab should be fine to use for this assignment.
Azure CLI installed and configured on the Jenkins server for deployment.
Maven/Node.js (or other package managers) installed on the Jenkins server (depending on your chosen language for the Azure Function).
Assignment Instructions:
Part 1: Set Up the Azure Function
Create an Azure Function:
Use Azure Functions to create a simple "Hello World" function.

You can use C#, JavaScript, or Python to write the function. Below is an example of a simple HTTP-triggered Azure Function in JavaScript.
module.exports = async function (context, req) {
context.res = {
status: 200,
body: "Hello, World!"
};
};
Deploy the Azure Function manually to ensure it works and is publicly accessible.

Note the Function App Name and Resource Group for deployment later.

Part 2: Set Up GitHub Repository
Create a GitHub Repository:

Create a new GitHub repository and push the Azure Function code (from Part 1) into this repository.
Ensure that your code includes a package.json (for Node.js) or requirements.txt (for Python), or other relevant package manager files.
Name the repo appropriately and include Student ID or Name (initials) where necessary
Push the Code to GitHub

Part 3: Set Up Jenkins
Install Jenkins (if not already installed):

Install Jenkins on a local machine or an Azure VM (using a quick-start template in the Azure marketplace).
Ensure that Jenkins has GitHub integration and can access the internet for installing dependencies like Azure CLI.
Install Necessary Plugins:

GitHub Plugin: To allow Jenkins to pull code from GitHub.
Azure CLI Plugin: To deploy to Azure.
Pipeline Plugin: For defining Jenkins Pipelines as code.
Configure Jenkins with GitHub:

Connect Jenkins to your GitHub repository by using GitHub Personal Access Tokens.
Create a new Jenkins job or pipeline and configure it to pull the code from your GitHub repository.
Create a New Jenkins Pipeline:

Define your Jenkins pipeline in the Jenkinsfile (version-controlled in GitHub).
The pipeline should have at least three stages:
Build Stage: Install dependencies and prepare the application.
Test Stage: Run at least 3 automated test cases.
Deploy Stage: Deploy the Azure Function to Azure.
Part 4: Define the Jenkins Pipeline (Jenkinsfile)
Build Stage:

Install any necessary dependencies and prepare the code. For example, if using Node.js:
pipeline {
agent any
stages {
stage('Build') {
steps {
script {
echo 'Building the application...'
sh 'npm install' // or equivalent for your chosen language
}
}
}
}
Test Stage:

Implement a test stage that runs at least three test cases. You can use a framework such as Mocha or Jest for Node.js, or pytest for Python.

Example with Jest (Node.js):

        stage('Test') {
            steps {
                script {
                    echo 'Running tests...'
                    sh 'npm test'  // Or run your test suite command
                }
            }
        }

The tests should check:

Basic HTTP response from Azure Function (e.g., "Hello, World!").
Response code (200).
Any edge case handling (optional).
Example Jest test:

const request = require('supertest');
const app = require('./app'); // Your function app

describe('GET /', () => {
it('should return 200 status code', async () => {
const response = await request(app).get('/');
expect(response.status).toBe(200);
expect(response.text).toBe('Hello, World!');
});
});
Deploy Stage:

Deploy the Azure Function using the Azure CLI.

Use az functionapp deployment source config-zip or equivalent commands to deploy the function.

Example:

        stage('Deploy') {
            steps {
                script {
                    echo 'Deploying to Azure...'
                    sh """
                        az login --service-principal -u $AZURE_CLIENT_ID -p $AZURE_CLIENT_SECRET --tenant $AZURE_TENANT_ID
                        az functionapp deployment source config-zip --resource-group $RESOURCE_GROUP --name $FUNCTION_APP_NAME --src function.zip
                    """
                }
            }
        }
    }

}
You can use Azure Service Principal for authentication in Jenkins. Set the required environment variables for AZURE_CLIENT_ID, AZURE_CLIENT_SECRET, AZURE_TENANT_ID, and other relevant details in Jenkins.

Part 5: Testing the CI/CD Pipeline
Trigger the Pipeline:

Push new changes to your GitHub repository.
Verify that the Jenkins pipeline automatically triggers and successfully runs all three stages (Build, Test, Deploy).
Check Azure Deployment:

Go to the Azure Portal and verify that the function is deployed and is working correctly.
You can test the deployed function by visiting the Function URL in the browser or using Postman to send a GET request.
Test Logs and Results:

Ensure the Jenkins console shows successful completion of all stages.
Review the test results and ensure all three test cases pass.
