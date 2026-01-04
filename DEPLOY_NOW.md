# 🚀 Quick Deployment Guide - Follow These Steps

## Step 1: Push Code to GitHub (Required First!)

### 1.1 Create GitHub Repository
1. Go to [github.com](https://github.com) and sign in
2. Click the "+" icon → "New repository"
3. Name it: `blog-website` (or any name you like)
4. **Don't** initialize with README, .gitignore, or license
5. Click "Create repository"

### 1.2 Push Your Code
After creating the repo, GitHub will show you commands. Use these:

```bash
# Add all files
git add .

# Commit
git commit -m "Initial commit - ready for deployment"

# Add remote (replace YOUR_USERNAME with your GitHub username)
git remote add origin https://github.com/YOUR_USERNAME/blog-website.git

# Push to GitHub
git branch -M main
git push -u origin main
```

---

## Step 2: Deploy Backend to Railway

### 2.1 Create Railway Account
1. Go to [railway.app](https://railway.app)
2. Click "Start a New Project"
3. Sign up with **GitHub** (recommended - easier integration)
4. Authorize Railway to access your GitHub

### 2.2 Deploy Backend
1. Click **"New Project"**
2. Select **"Deploy from GitHub repo"**
3. Choose your `blog-website` repository
4. Railway will detect it's a Node.js project

### 2.3 Configure Backend Settings
1. Click on your service
2. Go to **Settings** tab
3. Set **Root Directory** to: `backend`
4. Go to **Variables** tab and add these:

```env
MONGODB_URI=your-mongodb-atlas-connection-string
JWT_SECRET=generate-a-random-32-character-string-here
JWT_EXPIRE=7d
NODE_ENV=production
PORT=5000
FRONTEND_URL=https://your-frontend.vercel.app
```

**Important:**
- Replace `MONGODB_URI` with your actual MongoDB Atlas connection string
- Generate a strong `JWT_SECRET` (you can use: https://randomkeygen.com/)
- Leave `FRONTEND_URL` for now - we'll update it after deploying frontend

### 2.4 Get Your Backend URL
1. Railway will automatically deploy
2. Go to **Settings** → **Domains**
3. Railway gives you a URL like: `https://your-app-production.up.railway.app`
4. **Copy this URL** - you'll need it for frontend!

---

## Step 3: Deploy Frontend to Vercel

### 3.1 Create Vercel Account
1. Go to [vercel.com](https://vercel.com)
2. Click "Sign Up"
3. Sign up with **GitHub** (recommended)

### 3.2 Deploy Frontend
1. Click **"Add New Project"**
2. Import your `blog-website` repository
3. Configure these settings:
   - **Framework Preset**: `Vite`
   - **Root Directory**: `./` (leave as root)
   - **Build Command**: `npm run build` (auto-detected)
   - **Output Directory**: `dist` (auto-detected)
   - **Install Command**: `npm install` (auto-detected)

### 3.3 Add Environment Variable
Before deploying, click **"Environment Variables"** and add:

```env
VITE_API_URL=https://your-railway-app.up.railway.app/api
```

**Replace** `https://your-railway-app.up.railway.app` with your actual Railway backend URL from Step 2.4

### 3.4 Deploy
1. Click **"Deploy"**
2. Wait 2-3 minutes for build to complete
3. Vercel will give you a URL like: `https://blog-website.vercel.app`
4. **Copy this URL** - this is your live website!

---

## Step 4: Connect Frontend and Backend

### 4.1 Update Backend CORS
1. Go back to **Railway** → Your service → **Variables**
2. Update `FRONTEND_URL` to your Vercel URL:
   ```env
   FRONTEND_URL=https://blog-website.vercel.app
   ```
3. Railway will automatically restart with new settings

### 4.2 Update MongoDB Atlas Network Access
1. Go to [MongoDB Atlas](https://cloud.mongodb.com)
2. Click **Network Access** (left sidebar)
3. Click **"Add IP Address"**
4. Click **"Allow Access from Anywhere"** (adds `0.0.0.0/0`)
5. Click **"Confirm"**

This allows Railway to connect to your database.

---

## Step 5: Create Admin User (Optional)

If you want to create an admin user in production:

1. Go to Railway → Your service → **Deployments**
2. Click on the latest deployment
3. Go to **Logs** tab
4. Or use Railway CLI:
   ```bash
   railway login
   railway link
   railway run node scripts/createAdmin.js
   ```

Admin credentials:
- Username: `admin`
- Password: `admin123`

---

## ✅ You're Done!

Your website is now live! 🎉

**Your URLs:**
- **Frontend (Website)**: `https://blog-website.vercel.app`
- **Backend (API)**: `https://your-app.up.railway.app/api`

**Test it:**
1. Visit your Vercel URL
2. Register a new account
3. Create a blog post
4. Everything should work!

---

## 🔄 Future Updates

Whenever you make changes:
```bash
git add .
git commit -m "Your changes"
git push origin main
```

Both Railway and Vercel will automatically redeploy! 🚀

---

## 🐛 Troubleshooting

**Backend not connecting to MongoDB?**
- Check MongoDB Atlas Network Access allows `0.0.0.0/0`
- Verify `MONGODB_URI` in Railway variables is correct

**Frontend can't connect to backend?**
- Check `VITE_API_URL` in Vercel matches your Railway URL
- Make sure Railway URL ends with `/api`
- Check Railway logs for errors

**CORS errors?**
- Verify `FRONTEND_URL` in Railway matches your Vercel URL exactly
- Make sure both URLs use `https://`

