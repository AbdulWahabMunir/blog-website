# 🚀 Step-by-Step Deployment Instructions

## Overview
We'll deploy your blog website to:
- **Backend**: Railway (free tier available)
- **Frontend**: Vercel (free tier, unlimited)
- **Database**: MongoDB Atlas (already set up)

**Total Cost: $0/month** 🎉

---

## 📋 Prerequisites Checklist

Before starting, make sure you have:
- [ ] GitHub account (free)
- [ ] MongoDB Atlas account with connection string ready
- [ ] Your code committed and ready to push

---

## Step 1: Push Code to GitHub ⭐ (DO THIS FIRST!)

### Option A: Create New Repository on GitHub

1. **Go to GitHub**: https://github.com/new
2. **Repository name**: `blog-website` (or any name)
3. **Visibility**: Public or Private (your choice)
4. **DO NOT** check "Initialize with README"
5. Click **"Create repository"**

### Option B: Use Existing Repository

If you already have a GitHub repo, skip to the push commands below.

### Push Your Code

Run these commands in your terminal (from project root):

```bash
# Stage all files
git add .

# Commit
git commit -m "Initial commit - ready for deployment"

# Add GitHub remote (replace YOUR_USERNAME and REPO_NAME)
git remote add origin https://github.com/YOUR_USERNAME/REPO_NAME.git

# Push to GitHub
git branch -M main
git push -u origin main
```

**If you get authentication errors**, you may need to:
- Use a Personal Access Token instead of password
- Or use GitHub Desktop app

---

## Step 2: Deploy Backend to Railway 🚂

### 2.1 Sign Up for Railway

1. Go to **https://railway.app**
2. Click **"Start a New Project"**
3. Sign up with **GitHub** (recommended - one-click deploy)
4. Authorize Railway to access your repositories

### 2.2 Create New Project

1. Click **"New Project"**
2. Select **"Deploy from GitHub repo"**
3. Choose your `blog-website` repository
4. Railway will auto-detect it's a Node.js project

### 2.3 Configure Backend

1. Click on your service (the deployed app)
2. Go to **Settings** tab
3. Find **"Root Directory"** section
4. Set it to: `backend`
5. Click **"Save"**

### 2.4 Add Environment Variables

1. Go to **Variables** tab
2. Click **"New Variable"** and add these one by one:

```env
MONGODB_URI=mongodb+srv://username:password@cluster.mongodb.net/blog-db?retryWrites=true&w=majority
```

**Replace with your actual MongoDB Atlas connection string!**

```env
JWT_SECRET=your-super-secret-random-string-minimum-32-characters-long
```

**Generate a random string** (you can use: https://randomkeygen.com/ or just type random characters)

```env
JWT_EXPIRE=7d
NODE_ENV=production
PORT=5000
FRONTEND_URL=https://placeholder.vercel.app
```

**Note**: We'll update `FRONTEND_URL` after deploying frontend. For now, use a placeholder.

### 2.5 Get Your Backend URL

1. Railway will automatically start deploying
2. Wait 1-2 minutes for deployment to complete
3. Go to **Settings** → **Networking** → **Generate Domain**
4. Or Railway may auto-assign a domain like: `your-app-production.up.railway.app`
5. **Copy this URL** - you'll need it!

**Test it**: Visit the URL in browser. You should see:
```json
{"message":"Blog API Server is running!",...}
```

---

## Step 3: Deploy Frontend to Vercel ⚡

### 3.1 Sign Up for Vercel

1. Go to **https://vercel.com**
2. Click **"Sign Up"**
3. Sign up with **GitHub** (recommended)
4. Authorize Vercel to access your repositories

### 3.2 Create New Project

1. Click **"Add New Project"**
2. Import your `blog-website` repository
3. Vercel will auto-detect it's a Vite project

### 3.3 Configure Build Settings

Verify these settings (should be auto-detected):
- **Framework Preset**: `Vite`
- **Root Directory**: `./` (root of repo)
- **Build Command**: `npm run build`
- **Output Directory**: `dist`
- **Install Command**: `npm install`

### 3.4 Add Environment Variable

**BEFORE clicking Deploy**, scroll down to **"Environment Variables"**:

1. Click **"Add"** or **"New"**
2. **Key**: `VITE_API_URL`
3. **Value**: `https://your-railway-app.up.railway.app/api`

**Replace** `https://your-railway-app.up.railway.app` with your actual Railway backend URL from Step 2.5

**Important**: Make sure the URL ends with `/api`

### 3.5 Deploy

1. Click **"Deploy"**
2. Wait 2-3 minutes for build to complete
3. Vercel will show you a URL like: `https://blog-website.vercel.app`
4. **Copy this URL** - this is your live website! 🎉

---

## Step 4: Connect Everything 🔗

### 4.1 Update Backend CORS

1. Go back to **Railway** → Your service → **Variables**
2. Find `FRONTEND_URL`
3. Update it to your Vercel URL:
   ```env
   FRONTEND_URL=https://blog-website.vercel.app
   ```
4. Railway will automatically restart with new settings

### 4.2 Update MongoDB Atlas Network Access

1. Go to **MongoDB Atlas** → https://cloud.mongodb.com
2. Click **"Network Access"** (left sidebar)
3. Click **"Add IP Address"**
4. Click **"Allow Access from Anywhere"** (adds `0.0.0.0/0`)
5. Click **"Confirm"**

This allows Railway to connect to your database.

---

## Step 5: Test Your Deployment ✅

### Test Backend
Visit: `https://your-railway-app.up.railway.app`
Should see: `{"message":"Blog API Server is running!",...}`

### Test Frontend
1. Visit: `https://your-vercel-app.vercel.app`
2. Try registering a new account
3. Try creating a blog post
4. Everything should work!

---

## Step 6: Create Admin User (Optional) 👤

If you want to create an admin user in production:

### Option A: Using Railway CLI

```bash
# Install Railway CLI
npm i -g @railway/cli

# Login
railway login

# Link to your project
railway link

# Run admin script
railway run node scripts/createAdmin.js
```

### Option B: Using Railway Dashboard

1. Go to Railway → Your service → **Deployments**
2. Click on latest deployment
3. Go to **Logs** tab
4. You can see the output there

**Admin Credentials:**
- Username: `admin`
- Password: `admin123`
- Email: `admin@blog.com`

---

## 🎉 Success! Your Website is Live!

**Your Live URLs:**
- **Frontend**: `https://your-app.vercel.app`
- **Backend API**: `https://your-app.up.railway.app/api`

Share your Vercel URL with others - your blog is now live on the internet! 🌐

---

## 🔄 Making Updates

Whenever you make changes to your code:

```bash
git add .
git commit -m "Your update message"
git push origin main
```

Both Railway and Vercel will **automatically redeploy** your changes! 🚀

---

## 🐛 Troubleshooting

### Backend Issues

**"MongoDB connection error"**
- Check `MONGODB_URI` in Railway variables is correct
- Verify MongoDB Atlas Network Access allows `0.0.0.0/0`
- Check Railway logs for detailed error

**"Port already in use"**
- Railway automatically sets PORT - don't worry about this
- Your code already handles it with `process.env.PORT || 5000` ✅

**"CORS error"**
- Verify `FRONTEND_URL` in Railway matches your Vercel URL exactly
- Make sure both URLs use `https://`
- Check browser console for specific CORS error

### Frontend Issues

**"API connection failed"**
- Check `VITE_API_URL` in Vercel environment variables
- Verify backend URL ends with `/api`
- Test backend URL directly in browser
- Check browser console for errors

**"Build failed"**
- Check Vercel build logs
- Ensure all dependencies are in `package.json`
- Verify Node.js version compatibility

---

## 📞 Need Help?

- **Railway Docs**: https://docs.railway.app
- **Vercel Docs**: https://vercel.com/docs
- **MongoDB Atlas Docs**: https://docs.atlas.mongodb.com

---

## 💰 Pricing

**Free Tier Limits:**
- **Railway**: $5 free credit/month (enough for small projects)
- **Vercel**: Unlimited for personal projects
- **MongoDB Atlas**: 512MB free (plenty for your blog)

**Total Cost: $0/month** for your project! 🎉

---

Good luck with your deployment! 🚀

