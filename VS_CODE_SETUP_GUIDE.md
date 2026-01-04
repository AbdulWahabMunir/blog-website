# Complete Setup Guide for Visual Studio Code

This guide will walk you through setting up the entire blog project in Visual Studio Code from scratch, including creating a new MongoDB Atlas account.

---

## 📋 Prerequisites Checklist

Before starting, make sure you have:
- [ ] A computer with Windows/Mac/Linux
- [ ] Internet connection
- [ ] An email address (for MongoDB Atlas account)

---

## Step 1: Install Node.js and npm

### 1.1 Download Node.js
1. Go to: **https://nodejs.org/**
2. Download the **LTS (Long Term Support)** version (recommended)
3. Run the installer
4. Follow the installation wizard (accept all defaults)
5. **Restart your computer** after installation

### 1.2 Verify Installation
1. Open **Command Prompt** (Windows) or **Terminal** (Mac/Linux)
2. Type these commands and press Enter:
   ```bash
   node --version
   npm --version
   ```
3. You should see version numbers (e.g., `v18.17.0` and `9.6.7`)
4. ✅ If you see versions, Node.js is installed correctly!

---

## Step 2: Install Visual Studio Code

### 2.1 Download VS Code
1. Go to: **https://code.visualstudio.com/**
2. Click **"Download for Windows"** (or Mac/Linux)
3. Run the installer
4. Follow the installation wizard
5. ✅ Check "Add to PATH" during installation (if available)

### 2.2 Install Recommended Extensions (Optional but Helpful)
1. Open VS Code
2. Press `Ctrl+Shift+X` (Windows) or `Cmd+Shift+X` (Mac) to open Extensions
3. Search and install:
   - **ES7+ React/Redux/React-Native snippets**
   - **Prettier - Code formatter**
   - **ESLint**
   - **JavaScript (ES6) code snippets**

---

## Step 3: Open Project in VS Code

### 3.1 Open the Project Folder
1. Open **Visual Studio Code**
2. Click **File** → **Open Folder** (or press `Ctrl+K` then `Ctrl+O`)
3. Navigate to your project folder: `C:\Users\LENOVO\Cursor Project`
4. Click **Select Folder**
5. ✅ Your project files should now be visible in the left sidebar

---

## Step 4: Create MongoDB Atlas Account (NEW ACCOUNT)

### 4.1 Sign Up for MongoDB Atlas
1. Go to: **https://www.mongodb.com/cloud/atlas/register**
2. Click **"Try Free"** or **"Sign Up"**
3. Fill in the registration form:
   - **Email**: Your email address
   - **Password**: Create a strong password
   - **First Name**: Your first name
   - **Last Name**: Your last name
   - **Company Name**: (Optional) - You can put "Personal" or "Student"
4. Click **"Create your Atlas account"**
5. Check your email and **verify your email address** (click the verification link)

### 4.2 Complete Account Setup
1. After email verification, you'll be asked:
   - **"What is your goal today?"** → Select **"Learn"** or **"Build a new application"**
   - **"What will you be building?"** → Select **"Web Application"**
   - **"What is your preferred language?"** → Select **"JavaScript"** or **"Node.js"**
2. Click **"Finish"** or **"Continue"**

### 4.3 Create a Free Cluster
1. You'll see **"Deploy a cloud database"**
2. Select **"M0 FREE"** (Free tier - perfect for development)
3. **Cloud Provider**: Choose **AWS** (or any provider)
4. **Region**: Choose the **closest region** to your location (e.g., `us-east-1` for US East)
5. Click **"Create"** (or **"Create Cluster"**)
6. ⏳ Wait 3-5 minutes for the cluster to be created (you'll see a progress bar)

### 4.4 Create Database User
1. While the cluster is creating, you'll see a **"Security Quickstart"** popup
2. **Username**: Enter a username (e.g., `blog_user` or `myuser`)
3. **Password**: Click **"Autogenerate Secure Password"** or create your own
   - ⚠️ **IMPORTANT**: **Copy and save this password** - you'll need it!
   - Example: `MySecurePass123!`
4. Click **"Create Database User"**
5. ✅ User created successfully!

### 4.5 Whitelist IP Address
1. You'll see **"Where would you like to connect from?"**
2. Click **"Add My Current IP Address"** (this adds your current IP)
3. **OR** for development, click **"Allow Access from Anywhere"**
   - This adds `0.0.0.0/0` (allows all IPs - **OK for development only**)
4. Click **"Finish and Close"**

### 4.6 Get Connection String
1. After cluster is created, click **"Connect"** button (on your cluster card)
2. Select **"Connect your application"**
3. **Driver**: Select **"Node.js"**
4. **Version**: Select **"5.5 or later"** (or latest)
5. You'll see a connection string like:
   ```
   mongodb+srv://<username>:<password>@cluster0.xxxxx.mongodb.net/?retryWrites=true&w=majority
   ```
6. **Copy this connection string** - you'll need it in Step 6!
7. Replace `<username>` with your database username
8. Replace `<password>` with your database password
9. Add database name at the end: `?retryWrites=true&w=majority` → `?retryWrites=true&w=majority&appName=Cluster0`
   - Final format: `mongodb+srv://blog_user:MySecurePass123!@cluster0.xxxxx.mongodb.net/blog-db?retryWrites=true&w=majority`
10. ✅ **Save this connection string** - you'll paste it in `.env` file later!

---

## Step 5: Install Frontend Dependencies

### 5.1 Open Terminal in VS Code
1. In VS Code, click **Terminal** → **New Terminal** (or press `` Ctrl+` ``)
2. ✅ A terminal should open at the bottom of VS Code

### 5.2 Install Frontend Packages
1. Make sure you're in the **project root** directory (you should see `package.json` in the file explorer)
2. In the terminal, type:
   ```bash
   npm install
   ```
3. Press **Enter**
4. ⏳ Wait 1-2 minutes for packages to install
5. ✅ You should see: `added XXX packages` when done

**What this installs:**
- React and React DOM
- React Router (for navigation)
- Axios (for API calls)
- Vite (build tool)
- react-easy-crop (for image cropping feature)

---

## Step 6: Install Backend Dependencies

### 6.1 Navigate to Backend Folder
1. In the same terminal, type:
   ```bash
   cd backend
   ```
2. Press **Enter**

### 6.2 Install Backend Packages
1. Type:
   ```bash
   npm install
   ```
2. Press **Enter**
3. ⏳ Wait 1-2 minutes for packages to install
4. ✅ You should see: `added XXX packages` when done

**What this installs:**
- Express (web server)
- Mongoose (MongoDB driver)
- JWT (authentication)
- bcryptjs (password hashing)
- CORS (cross-origin requests)
- dotenv (environment variables)

---

## Step 7: Create Backend Environment File (.env)

### 7.1 Create .env File
1. In VS Code, in the left sidebar, navigate to **`backend`** folder
2. Right-click on **`backend`** folder → **New File**
3. Name it exactly: **`.env`** (with the dot at the beginning)
4. ✅ A new file `.env` should appear

### 7.2 Add Environment Variables
1. Open the `.env` file
2. Copy and paste this template:
   ```env
   MONGODB_URI=mongodb+srv://YOUR_USERNAME:YOUR_PASSWORD@cluster0.xxxxx.mongodb.net/blog-db?retryWrites=true&w=majority
   JWT_SECRET=your-super-secret-key-change-this-in-production-12345
   JWT_EXPIRE=7d
   PORT=5000
   NODE_ENV=development
   ```

3. **Replace the values:**
   - **`YOUR_USERNAME`**: Replace with your MongoDB Atlas database username (from Step 4.4)
   - **`YOUR_PASSWORD`**: Replace with your MongoDB Atlas database password (from Step 4.4)
   - **`cluster0.xxxxx`**: Replace with your actual cluster address (from Step 4.6)
   - **Example:**
     ```env
     MONGODB_URI=mongodb+srv://blog_user:MySecurePass123!@cluster0.cf13vci.mongodb.net/blog-db?retryWrites=true&w=majority
     JWT_SECRET=my-secret-jwt-key-2024
     JWT_EXPIRE=7d
     PORT=5000
     NODE_ENV=development
     ```

4. **Save the file** (`Ctrl+S`)

⚠️ **IMPORTANT**: Never share your `.env` file or commit it to Git!

---

## Step 8: Create Frontend Environment File (.env) - Optional

### 8.1 Create .env File in Root
1. In VS Code, in the left sidebar, navigate to **root** folder (project root)
2. Right-click on **root** folder → **New File**
3. Name it: **`.env`**
4. Open the `.env` file

### 8.2 Add Frontend Environment Variable
1. Copy and paste:
   ```env
   VITE_API_URL=http://localhost:5000/api
   ```
2. **Save the file** (`Ctrl+S`)

**Note**: This is optional - the app will use `http://localhost:5000/api` by default if this file doesn't exist.

---

## Step 9: Create Admin User in MongoDB

### 9.1 Run Admin Creation Script
1. In the terminal, make sure you're in the **`backend`** folder:
   ```bash
   cd backend
   ```
2. Type:
   ```bash
   node scripts/createAdmin.js
   ```
3. Press **Enter**
4. ✅ You should see:
   ```
   ✅ Connected to MongoDB Atlas
   ✅ Admin user created successfully!
   Username: admin
   Password: admin123
   ```

**This creates:**
- Username: `admin`
- Password: `admin123`
- Email: `admin@blog.com`
- Role: `admin`

⚠️ **Note**: Change this password in production!

---

## Step 10: Start Backend Server

### 10.1 Start Backend
1. In the terminal, make sure you're in **`backend`** folder:
   ```bash
   cd backend
   ```
2. Type:
   ```bash
   npm run dev
   ```
3. Press **Enter**
4. ✅ You should see:
   ```
   ✅ Connected to MongoDB Atlas
   🚀 Server is running on port 5000
   ```

5. ✅ **Keep this terminal open!** The server must keep running.

**If you see an error:**
- **Port 5000 already in use**: Change `PORT=5001` in `backend/.env` and restart
- **MongoDB connection failed**: Check your `.env` file - verify username, password, and connection string

---

## Step 11: Start Frontend Server

### 11.1 Open New Terminal
1. In VS Code, click **Terminal** → **New Terminal** (or press `` Ctrl+Shift+` ``)
2. ✅ A **second terminal** should open

### 11.2 Start Frontend
1. Make sure you're in the **project root** (not `backend` folder)
2. If you're in `backend`, type:
   ```bash
   cd ..
   ```
3. Type:
   ```bash
   npm run dev
   ```
4. Press **Enter**
5. ⏳ Wait a few seconds
6. ✅ You should see:
   ```
   VITE v7.x.x  ready in xxx ms

   ➜  Local:   http://localhost:5173/
   ➜  Network: use --host to expose
   ```

7. ✅ **Keep this terminal open too!**

---

## Step 12: Open the Website

### 12.1 Open in Browser
1. Open your web browser (Chrome, Firefox, Edge, etc.)
2. Go to: **http://localhost:5173**
3. ✅ You should see the blog website homepage!

### 12.2 Test Login
1. Click **"Login"** in the navigation
2. Enter:
   - **Username**: `admin`
   - **Password**: `admin123`
3. Click **"Login"**
4. ✅ You should be logged in as admin!

### 12.3 Test Registration
1. Click **"Logout"** (if logged in)
2. Click **"Register"**
3. Fill in the form:
   - **Username**: `testuser`
   - **Email**: `test@example.com`
   - **Password**: `test123`
4. Click **"Register"**
5. ✅ You should be registered and logged in!

---

## ✅ Setup Complete!

Your project is now fully set up and running! 🎉

### What's Running:
- ✅ **Backend Server**: `http://localhost:5000` (Terminal 1)
- ✅ **Frontend Server**: `http://localhost:5173` (Terminal 2)
- ✅ **MongoDB Atlas**: Connected and working

### Quick Commands Reference:

**Start Backend:**
```bash
cd backend
npm run dev
```

**Start Frontend:**
```bash
npm run dev
```

**Stop Servers:**
- Press `Ctrl+C` in the terminal to stop

---

## 🐛 Troubleshooting

### Problem: "Cannot find module 'xxx'"
**Solution**: Run `npm install` in the folder where the error occurs

### Problem: "Port 5000 already in use"
**Solution**: 
1. Change `PORT=5001` in `backend/.env`
2. Change `VITE_API_URL=http://localhost:5001/api` in root `.env`
3. Restart both servers

### Problem: "MongoDB connection failed"
**Solution**:
1. Check `backend/.env` file - verify `MONGODB_URI` is correct
2. Make sure username and password are correct (no extra spaces)
3. Verify IP address is whitelisted in MongoDB Atlas
4. Check if cluster is running in MongoDB Atlas dashboard

### Problem: "npm: command not found"
**Solution**: Node.js is not installed or not in PATH. Reinstall Node.js and restart computer.

### Problem: Frontend shows "Cannot connect to API"
**Solution**:
1. Make sure backend server is running (`npm run dev` in `backend` folder)
2. Check `VITE_API_URL` in root `.env` matches backend port
3. Check browser console for errors

---

## 📝 Next Steps

1. ✅ Explore the website
2. ✅ Create a blog post
3. ✅ Test admin features
4. ✅ Customize colors and styles
5. ✅ Add more features if needed

---

## 🆘 Need Help?

- Check `README.md` for project overview
- Check `MONGODB_SETUP.md` for detailed MongoDB setup
- Check browser console (F12) for frontend errors
- Check terminal for backend errors

**Happy Coding! 🚀**

