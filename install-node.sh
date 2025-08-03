#!/bin/bash

# Install Node.js in Jenkins environment
echo "Installing Node.js for Jenkins..."

# Check if Homebrew is available
if command -v brew &> /dev/null; then
    echo "Homebrew found, installing Node.js..."
    brew install node@22
    
    # Add to PATH
    echo 'export PATH="/opt/homebrew/bin:$PATH"' >> ~/.bashrc
    export PATH="/opt/homebrew/bin:$PATH"
    
    # Verify installation
    node --version
    npm --version
else
    echo "Homebrew not found, trying alternative installation..."
    
    # Try to use existing Node.js installation
    if [ -d "/Users/raychen/.nvm/versions/node/v22.14.0" ]; then
        echo "Using existing Node.js installation..."
        export PATH="/Users/raychen/.nvm/versions/node/v22.14.0/bin:$PATH"
        node --version
        npm --version
    else
        echo "Node.js installation not found. Please install manually."
        exit 1
    fi
fi

echo "Node.js setup completed." 