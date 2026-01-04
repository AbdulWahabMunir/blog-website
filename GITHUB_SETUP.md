# 📤 Push Code to GitHub - Step by Step

## Prerequisites

### Step 1: Install Git (if not installed)

1. Download Git from: https://git-scm.com/download/win
2. Run the installer (use default settings)
3. Restart your terminal/VS Code after installation

### Step 2: Verify Git Installation

Open a new terminal and run:
```bash
git --version
```

You should see something like: `git version 2.x.x`

---

## Information Needed

To push your code, I need:

1. **Your GitHub Username**: (e.g., `john-doe`)
2. **Repository Name**: (e.g., `blog-website` or `final-year-project`)

**Note**: The repository will be created on GitHub if it doesn't exist.

---

## Quick Setup (After Git is Installed)

Once you provide your GitHub username and repository name, I'll help you:

1. Initialize Git repository
2. Add all files
3. Create initial commit
4. Connect to GitHub
5. Push your code

---

## Manual Steps (If you prefer to do it yourself)

### 1. Initialize Git
```bash
git init
```

### 2. Add All Files
```bash
git add .
```

### 3. Create First Commit
```bash
git commit -m "Initial commit: Blog website with MongoDB Atlas"
```

### 4. Create Repository on GitHub
1. Go to https://github.com/new
2. Repository name: `your-repo-name`
3. Description: "Blog Website - Final Year Project"
4. Choose Public or Private
5. **Don't** initialize with README (we already have one)
6. Click "Create repository"

### 5. Connect and Push
```bash
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git
git branch -M main
git push -u origin main
```

You'll be prompted for your GitHub username and password (or Personal Access Token).

---

## Using GitHub Desktop (Easier Alternative)

If you prefer a GUI:

1. Download GitHub Desktop: https://desktop.github.com/
2. Sign in with your GitHub account
3. File → Add Local Repository
4. Select your project folder
5. Click "Publish repository"
6. Enter repository name and description
7. Click "Publish repository"

---

## After Pushing

Once your code is on GitHub, you can:

1. Deploy to Railway (backend) - connect your GitHub repo
2. Deploy to Vercel (frontend) - connect your GitHub repo
3. Both will auto-deploy on every push! 🚀

---

## Need Help?

Just provide:
- Your GitHub username
- Your preferred repository name

And I'll create the commands for you!




