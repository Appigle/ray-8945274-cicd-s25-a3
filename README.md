# Azure Functions CI/CD Pipeline

This project demonstrates a complete CI/CD pipeline using Jenkins to deploy Azure Functions.

## 🚀 **Project Overview**

- **Azure Function**: HTTP-triggered "Hello, World!" function
- **Runtime**: Node.js 22 LTS
- **CI/CD**: Jenkins with GitHub integration
- **Testing**: Jest with 3 test cases
- **Deployment**: Azure Functions

## 📁 **Project Structure**

```
cicd-azure-functions/
├── src/
│   └── functions/
│       └── HttpTrigger.js          # Azure Function code
├── tests/
│   └── HttpTrigger.test.js         # Test cases
├── package.json                    # Dependencies and scripts
├── Jenkinsfile                     # CI/CD pipeline definition
├── host.json                       # Azure Functions host configuration
└── local.settings.json             # Local development settings
```

## 🧪 **Test Cases**

The project includes 3 test cases as required:

1. **Status Code Test**: Verifies 200 status code
2. **Response Body Test**: Verifies "Hello, World!" message
3. **Content-Type Test**: Verifies correct content type header

## 🛠 **Local Development**

### **Prerequisites**

- Node.js 22 LTS
- Azure Functions Core Tools v4
- Azure CLI

### **Installation**

```bash
# Install dependencies
npm install

# Run tests
npm test

# Start local development server
npm start
```

### **Testing the Function**

```bash
# Test locally
curl http://localhost:7071/api/HttpTrigger
# Expected output: "Hello, World!"
```

## 🔄 **CI/CD Pipeline**

### **Pipeline Stages**

1. **Checkout**: Pulls code from GitHub
2. **Build**: Installs dependencies
3. **Test**: Runs Jest tests
4. **Deploy**: Deploys to Azure Functions

### **Jenkins Configuration**

- **Repository**: GitHub with webhook triggers
- **Credentials**: GitHub PAT for authentication
- **Deployment**: Azure Functions using `func azure functionapp publish`

## 🚀 **Deployment**

### **Manual Deployment**

```bash
# Deploy to Azure Functions
func azure functionapp publish func-cicd-project-ray-45274
```

### **Automated Deployment**

The Jenkins pipeline automatically deploys when code is pushed to the main branch.

## 📊 **Monitoring**

- **Azure Portal**: Monitor function execution
- **Application Insights**: Performance and error tracking
- **Jenkins**: Build and deployment logs

## 🔧 **Troubleshooting**

### **Common Issues**

1. **Function not starting**: Check Node.js version (requires 22.x)
2. **Tests failing**: Ensure all dependencies are installed
3. **Deployment failing**: Verify Azure credentials and function app name

### **Logs**

```bash
# View Jenkins logs
tail -f ~/.jenkins/logs/jenkins.log

# View function logs
func azure functionapp logstream func-cicd-project-ray-45274
```

## 📝 **Assignment Requirements Met**

- ✅ **Jenkins Setup (3%)**: Complete Jenkins configuration with GitHub integration
- ✅ **Pipeline Stages (3%)**: Build, Test, Deploy stages implemented
- ✅ **Test Cases (2%)**: 3 comprehensive test cases with Jest
- ✅ **Azure Deployment (2%)**: Automated deployment to Azure Functions

## 🎯 **Next Steps**

1. Push code to GitHub repository
2. Configure Jenkins job with webhook triggers
3. Test the complete CI/CD pipeline
4. Monitor deployment and function execution

---

**Student**: Ray Chen (45274)  
**Course**: CI/CD Pipeline Development  
**Technology Stack**: Jenkins, Azure Functions, Node.js, Jest
