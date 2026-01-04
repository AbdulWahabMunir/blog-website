#!/bin/bash

# GitHub Push Script
# Run this in Git Bash terminal

echo "🚀 Setting up GitHub repository..."

# Navigate to project directory
cd "C:/Users/LENOVO/Cursor Project"

# Initialize git (if not already initialized)
if [ ! -d ".git" ]; then
    echo "📦 Initializing Git repository..."
    git init
fi

# Add all files
echo "📝 Adding files..."
git add .

# Create initial commit
echo "💾 Creating commit..."
git commit -m "Initial commit: Blog website with MongoDB Atlas backend"

# Set branch to main
git branch -M main

echo ""
echo "✅ Ready to push!"
echo ""
echo "Next steps:"
echo "1. Create a new repository on GitHub (https://github.com/new)"
echo "2. Don't initialize with README (we already have one)"
echo "3. Copy the repository URL"
echo "4. Run these commands:"
echo ""
echo "   git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git"
echo "   git push -u origin main"
echo ""
echo "Replace YOUR_USERNAME and YOUR_REPO_NAME with your actual values!"




