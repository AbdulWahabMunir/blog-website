# 🚀 Push to GitHub - Git Bash Commands

## Step-by-Step Instructions

**Run these commands in your Git Bash terminal (MINGW64)**

---

## Step 1: Navigate to Your Project

```bash
cd "C:/Users/LENOVO/Cursor Project"
```

---

## Step 2: Initialize Git (if not already done)

```bash
git init
```

---

## Step 3: Add All Files

```bash
git add .
```

---

## Step 4: Create First Commit

```bash
git commit -m "Initial commit: Blog website with MongoDB Atlas backend"
```

---

## Step 5: Set Main Branch

```bash
git branch -M main
```

---

## Step 6: Create Repository on GitHub

1. Go to: https://github.com/new
2. **Repository name**: Enter your desired name (e.g., `blog-website`)
3. **Description**: "Blog Website - Final Year Project with MongoDB Atlas"
4. Choose **Public** or **Private**
5. **⚠️ IMPORTANT**: Do NOT check "Initialize with README" (we already have one)
6. Click **"Create repository"**

---

## Step 7: Connect to GitHub

Replace `YOUR_USERNAME` and `YOUR_REPO_NAME` with your actual values:

```bash
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git
```

**Example:**
```bash
git remote add origin https://github.com/ThomasShelby/blog-website.git
```

---

## Step 8: Push to GitHub

```bash
git push -u origin main
```

You'll be prompted for:
- **Username**: Your GitHub username
- **Password**: Use a **Personal Access Token** (not your GitHub password)

### How to Create Personal Access Token:

1. Go to: https://github.com/settings/tokens
2. Click **"Generate new token"** → **"Generate new token (classic)"**
3. Name it: "Blog Project"
4. Select scopes: Check **"repo"** (full control of private repositories)
5. Click **"Generate token"**
6. **Copy the token** (you won't see it again!)
7. Use this token as your password when pushing

---

## ✅ Done!

Your code is now on GitHub! 🎉

You can now:
1. Deploy to Railway (connect GitHub repo)
2. Deploy to Vercel (connect GitHub repo)
3. Share your repository URL

---

## Quick Copy-Paste (All Steps)

```bash
# Navigate to project
cd "C:/Users/LENOVO/Cursor Project"

# Initialize and commit
git init
git add .
git commit -m "Initial commit: Blog website with MongoDB Atlas backend"
git branch -M main

# Add remote (REPLACE WITH YOUR VALUES)
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git

# Push
git push -u origin main
```

---

## Troubleshooting

### "remote origin already exists"
```bash
git remote remove origin
git remote add origin https://github.com/YOUR_USERNAME/YOUR_REPO_NAME.git
```

### "Authentication failed"
- Make sure you're using a Personal Access Token, not your password
- Create a new token if needed

### "Repository not found"
- Make sure the repository exists on GitHub
- Check your username and repository name are correct




