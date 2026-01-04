# 🚀 Push to GitHub - Quick Instructions

## Step 1: Create GitHub Repository

1. Go to: **https://github.com/new**
2. **Repository name**: `blog-website` (or any name you prefer)
3. **Description**: "Full-stack blog website with React and Node.js"
4. **Visibility**: Choose Public or Private
5. **⚠️ IMPORTANT**: Do NOT check:
   - ❌ Add a README file
   - ❌ Add .gitignore
   - ❌ Choose a license
6. Click **"Create repository"**

## Step 2: Copy Your Repository URL

After creating the repo, GitHub will show you a page with commands. You'll see a URL like:
```
https://github.com/YOUR_USERNAME/blog-website.git
```

**Copy this URL** - you'll need it in the next step!

## Step 3: Push Your Code

Run these commands (replace YOUR_USERNAME and REPO_NAME):

```bash
git remote add origin https://github.com/YOUR_USERNAME/REPO_NAME.git
git branch -M main
git push -u origin main
```

**Example:**
If your username is `john` and repo is `blog-website`:
```bash
git remote add origin https://github.com/john/blog-website.git
git branch -M main
git push -u origin main
```

## ✅ Done!

Your code is now on GitHub! You can proceed to deploy to Railway and Vercel.

---

## 🔐 Authentication Note

If you're asked for credentials:
- **Username**: Your GitHub username
- **Password**: Use a **Personal Access Token** (not your GitHub password)

To create a token:
1. GitHub → Settings → Developer settings → Personal access tokens → Tokens (classic)
2. Generate new token
3. Select scopes: `repo` (full control)
4. Copy the token and use it as your password

