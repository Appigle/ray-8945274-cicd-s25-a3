pipeline {
    agent any
    environment {
        RESOURCE_GROUP = 'rg-cicd-project'
        FUNCTION_APP_NAME = 'func-cicd-project-ray-45274'
        PATH = "${env.PATH}:/Users/raychen/.nvm/versions/node/v22.14.0/bin:/opt/homebrew/bin"
        NODE_PATH = "/Users/raychen/.nvm/versions/node/v22.14.0/lib/node_modules"
    }
    parameters {
        string(name: 'AZURE_CLIENT_ID', defaultValue: '', description: 'Azure Service Principal Client ID')
        string(name: 'AZURE_CLIENT_SECRET', defaultValue: '', description: 'Azure Service Principal Client Secret')
        string(name: 'AZURE_TENANT_ID', defaultValue: '', description: 'Azure Tenant ID')
    }
    stages {
        stage('Checkout') {
            steps {
                echo 'Checking out code from GitHub...'
                checkout scm
            }
        }
        stage('Build') {
            steps {
                script {
                    echo 'Building the application...'
                    sh 'npm install'
                    echo 'Build completed successfully'
                }
            }
        }
        stage('Test') {
            steps {
                script {
                    echo 'Running tests...'
                    sh 'npm test'
                }
            }
            post {
                always {
                    // Archive test results if they exist
                    script {
                        if (fileExists('test-results')) {
                            archiveArtifacts artifacts: 'test-results/**/*', fingerprint: true
                        }
                    }
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    echo 'Deploying to Azure...'
                    
                    // Install Azure Functions Core Tools if not available
                    sh '''
                        if command -v func &> /dev/null; then
                            echo "Azure Functions Core Tools found"
                            func --version
                        else
                            echo "Installing Azure Functions Core Tools..."
                            npm install -g azure-functions-core-tools@4 --unsafe-perm true
                        fi
                    '''
                    
                    // Check Azure CLI and authentication
                    sh '''
                        echo "Checking for Azure CLI..."
                        echo "PATH: $PATH"
                        
                        if command -v az &> /dev/null; then
                            echo "Azure CLI found"
                            az --version
                            # Check if already logged in
                            if az account show &> /dev/null; then
                                echo "Already authenticated with Azure"
                                az account show --query "{name:name, id:id, tenantId:tenantId}" --output table
                            else
                                echo "Azure not authenticated, attempting interactive login..."
                                # For local Jenkins, we can try interactive login
                                echo "Please login to Azure in a separate terminal: az login"
                                echo "Then run this pipeline again"
                            fi
                        else
                            echo "Azure CLI not found in PATH"
                            echo "Trying to find Azure CLI in common locations..."
                            ls -la /opt/homebrew/bin/az 2>/dev/null || echo "Not found in /opt/homebrew/bin"
                            ls -la /usr/local/bin/az 2>/dev/null || echo "Not found in /usr/local/bin"
                            echo "Will proceed with deployment package creation"
                        fi
                    '''
                    
                    // Deploy the function
                    sh '''
                        echo "Deploying function to Azure..."
                        
                        # Check if Azure CLI is available for authentication
                        if command -v az &> /dev/null; then
                            echo "Azure CLI found, attempting deployment..."
                            
                            # Check if already authenticated
                            if az account show &> /dev/null; then
                                echo "Azure authentication confirmed, proceeding with deployment..."
                                
                                if command -v func &> /dev/null; then
                                    echo "Deploying function..."
                                    func azure functionapp publish $FUNCTION_APP_NAME --force
                                    
                                    if [ $? -eq 0 ]; then
                                        echo "Deployment successful!"
                                        echo "Function URL: https://$FUNCTION_APP_NAME.azurewebsites.net/api/HttpTrigger"
                                    else
                                        echo "Deployment failed, creating package for manual deployment..."
                                        zip -r function.zip . -x "node_modules/*" ".git/*" "*.log"
                                        echo "Deployment package created: function.zip"
                                    fi
                                else
                                    echo "Azure Functions Core Tools not available, creating deployment package..."
                                    zip -r function.zip . -x "node_modules/*" ".git/*" "*.log"
                                    echo "Deployment package created: function.zip"
                                    echo "Manual deployment required: func azure functionapp publish $FUNCTION_APP_NAME"
                                fi
                            else
                                echo "Azure not authenticated, creating deployment package for manual deployment..."
                                zip -r function.zip . -x "node_modules/*" ".git/*" "*.log"
                                echo "Deployment package created: function.zip"
                                echo "Manual deployment steps:"
                                echo "1. Login to Azure: az login"
                                echo "2. Deploy function: func azure functionapp publish $FUNCTION_APP_NAME"
                            fi
                        else
                            echo "Azure CLI not available, creating deployment package for manual deployment..."
                            zip -r function.zip . -x "node_modules/*" ".git/*" "*.log"
                            echo "Deployment package created: function.zip"
                            echo "Manual deployment steps:"
                            echo "1. Install Azure CLI: curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash"
                            echo "2. Login to Azure: az login"
                            echo "3. Deploy function: func azure functionapp publish $FUNCTION_APP_NAME"
                        fi
                    '''
                    
                    echo 'Deployment stage completed'
                }
            }
        }
    }
            post {
            always {
                // Archive deployment package if it exists
                script {
                    if (fileExists('function.zip')) {
                        archiveArtifacts artifacts: 'function.zip', fingerprint: true
                        echo 'Deployment package archived: function.zip'
                    }
                }
                cleanWs()
            }
            success {
                echo 'Pipeline completed successfully!'
            }
            failure {
                echo 'Pipeline failed!'
            }
        }
} 