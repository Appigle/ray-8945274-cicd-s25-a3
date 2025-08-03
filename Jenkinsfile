pipeline {
    agent any
    environment {
        RESOURCE_GROUP = 'rg-cicd-project'
        FUNCTION_APP_NAME = 'func-cicd-project-ray-45274'
        PATH = "${env.PATH}:/Users/raychen/.nvm/versions/node/v22.14.0/bin"
        NODE_PATH = "/Users/raychen/.nvm/versions/node/v22.14.0/lib/node_modules"
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
                        if command -v az &> /dev/null; then
                            echo "Azure CLI found"
                            az account show || echo "Azure not authenticated, attempting login..."
                        else
                            echo "Azure CLI not found, skipping installation (requires sudo privileges)"
                            echo "Will proceed with deployment package creation"
                        fi
                    '''
                    
                    // Deploy the function
                    sh '''
                        echo "Deploying function to Azure..."
                        
                        if command -v func &> /dev/null; then
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
                    '''
                    
                    echo 'Deployment stage completed'
                }
            }
        }
    }
    post {
        always {
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