# ⚡ Quick Deploy - 5 Steps to Go Live!

## 🎯 Your Deployment Plan

1. **Push to GitHub** → 2. **Deploy Backend (Railway)** → 3. **Deploy Frontend (Vercel)** → 4. **Connect Them** → 5. **Done!**

---

## Step 1: Push to GitHub (5 minutes)

### Create GitHub Repository
1. Go to https://github.com/new
2. Name: `blog-website`
3. **Don't** initialize with anything
4. Click "Create repository"

### Push Your Code
```bash
git add .
git commit -m "Ready for deployment"
git remote add origin https://github.com/YOUR_USERNAME/blog-website.git
git branch -M main
git push -u origin main
```

---

## Step 2: Deploy Backend to Railway (10 minutes)

1. **Sign up**: https://railway.app (use GitHub login)
2. **New Project** → **Deploy from GitHub repo** → Select your repo
3. **Settings** → **Root Directory**: Set to `backend`
4. **Variables** → Add these:

```env
MONGODB_URI=your-mongodb-connection-string
JWT_SECRET=random-32-character-string-here
JWT_EXPIRE=7d
NODE_ENV=production
PORT=5000
FRONTEND_URL=https://placeholder.vercel.app
```

5. **Copy your Railway URL** (e.g., `https://your-app.up.railway.app`)

---

## Step 3: Deploy Frontend to Vercel (10 minutes)

1. **Sign up**: https://vercel.com (use GitHub login)
2. **Add New Project** → Import your repo
3. **Environment Variables** → Add:

```env
VITE_API_URL=https://your-railway-app.up.railway.app/api
```

4. **Deploy** → Wait 2 minutes
5. **Copy your Vercel URL** (e.g., `https://blog-website.vercel.app`)

---

## Step 4: Connect Everything (2 minutes)

1. **Railway** → **Variables** → Update `FRONTEND_URL` to your Vercel URL
2. **MongoDB Atlas** → **Network Access** → Add `0.0.0.0/0`

---

## Step 5: Test! 🎉

Visit your Vercel URL - your website is live!

---

## 📝 Detailed Instructions

See `DEPLOYMENT_STEPS.md` for complete step-by-step guide with screenshots and troubleshooting.

---

## 🆘 Quick Help

**Backend not working?**
- Check MongoDB connection string in Railway
- Verify MongoDB Atlas allows `0.0.0.0/0`

**Frontend can't connect?**
- Check `VITE_API_URL` in Vercel matches Railway URL + `/api`
- Verify `FRONTEND_URL` in Railway matches Vercel URL

**Need more help?**
- See `DEPLOYMENT_STEPS.md` for detailed troubleshooting

---

**Ready? Let's deploy! 🚀**

