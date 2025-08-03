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
                    
                    // Check if Azure Functions Core Tools is available
                    sh '''
                        if command -v func &> /dev/null; then
                            echo "Azure Functions Core Tools found"
                            func --version
                            func azure functionapp publish $FUNCTION_APP_NAME
                        else
                            echo "Azure Functions Core Tools not found"
                            echo "Creating deployment package manually..."
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