# Blog Website - Project

A full-featured blog website with **MongoDB Atlas Cloud Database** backend. Built with React frontend and Node.js/Express backend, featuring user authentication, role-based access control (Admin and User), and complete CRUD operations for blog management.

## 🏗️ Architecture

- **Frontend**: React 18 + Vite
- **Backend**: Node.js + Express
- **Database**: MongoDB Atlas (Cloud)
- **Authentication**: JWT (JSON Web Tokens)
- **Password Security**: bcryptjs (hashing)

## ✨ Features

### User Roles & Permissions

#### Admin Role
- View all blogs from all users
- Delete any blog on the platform
- Access to Admin Dashboard
- Cannot edit blogs created by other users

#### User Role
- Register and login to the platform
- View all blogs (own and others)
- Create new blog posts
- Edit own blogs only
- Delete own blogs only
- Access to "My Blogs" page to manage personal content
- Cannot edit or delete blogs created by other users

### Blog Features

Each blog contains:
- **Blog Title**: Title of the blog post
- **Blog Description/Content**: Full content of the blog
- **Blog Category**: Category classification (Technology, Lifestyle, Travel, etc.)
- **Author Name**: Username of the blog creator
- **Date of Upload**: When the blog was created/updated

### Pages

1. **Home Page** - Display of blogs with search and category filter
2. **About Us Page** - Static information about the website
3. **Contact Us Page** - Contact form
4. **Login/Register Pages** - User authentication
5. **Create Blog Page** (Protected) - Form to create new blog
6. **My Blogs Page** (Protected) - View and manage user's own blogs
7. **Edit Blog Page** (Protected) - Edit existing blog
8. **View Blog Page** - View individual blog with full content
9. **Admin Dashboard** (Protected - Admin Only) - Manage all blogs

### Search & Filter Features

- **Search Bar**: Search blogs by title, category, or content
- **Category Filter**: Filter blogs by category
- Real-time filtering

## 🚀 Getting Started

### Prerequisites

- Node.js (v14 or higher)
- npm or yarn
- MongoDB Atlas account (free tier available)

### Step 1: Clone/Download Project

```bash
# If using git
git clone <your-repo-url>
cd blog-project
```

### Step 2: Set Up MongoDB Atlas

**Follow the detailed guide**: See `MONGODB_SETUP.md` for complete MongoDB Atlas setup instructions.

**Quick Summary**:
1. Create account at [MongoDB Atlas](https://www.mongodb.com/cloud/atlas)
2. Create a free cluster
3. Create database user
4. Whitelist IP address (use `0.0.0.0/0` for development)
5. Get connection string

### Step 3: Backend Setup

```bash
# Navigate to backend folder
cd backend

# Install dependencies
npm install

# Create .env file (copy from .env.example)
cp .env.example .env

# Edit .env file and add your MongoDB connection string
# MONGODB_URI=mongodb+srv://username:password@cluster.mongodb.net/blog-db?retryWrites=true&w=majority
# JWT_SECRET=your-secret-key-here
# PORT=5000
```

### Step 4: Create Admin User

After setting up MongoDB, create the default admin user:

```bash
cd backend
node scripts/createAdmin.js
```

This creates:
- Username: `admin`
- Password: `admin123`
- Email: `admin@blog.com`
- Role: `admin`

### Step 5: Start Backend Server

```bash
cd backend
npm run dev
```

Backend should run on `http://localhost:5000`

You should see:
```
✅ Connected to MongoDB Atlas
🚀 Server is running on port 5000
```

### Step 6: Frontend Setup

Open a **new terminal**:

```bash
# Navigate to project root (if not already there)
cd ..

# Install dependencies
npm install

# Create .env file (optional - defaults to http://localhost:5000/api)
# Create .env file in root directory
echo "VITE_API_URL=http://localhost:5000/api" > .env

# Start development server
npm run dev
```

Frontend should run on `http://localhost:5173`

### Step 7: Access the Application

1. Open browser: `http://localhost:5173`
2. Login with admin credentials:
   - Username: `admin`
   - Password: `admin123`
3. Or register a new user account

## 📁 Project Structure

```
├── backend/                  # Backend server
│   ├── models/              # MongoDB schemas
│   │   ├── User.js          # User model
│   │   └── Blog.js          # Blog model
│   ├── routes/              # API routes
│   │   ├── authRoutes.js    # Authentication routes
│   │   └── blogRoutes.js    # Blog CRUD routes
│   ├── middleware/          # Express middleware
│   │   └── authMiddleware.js # JWT authentication
│   ├── scripts/             # Utility scripts
│   │   └── createAdmin.js   # Create admin user
│   ├── server.js            # Express server entry point
│   ├── package.json
│   └── .env                 # Environment variables (create this)
│
├── src/                     # Frontend React app
│   ├── components/          # Reusable components
│   │   ├── Header.jsx       # Navigation header
│   │   ├── Footer.jsx       # Footer component
│   │   └── ProtectedRoute.jsx # Route protection
│   ├── context/             # React Context
│   │   ├── AuthContext.jsx  # Authentication state
│   │   └── BlogContext.jsx  # Blog state management
│   ├── pages/               # Page components
│   │   ├── Home.jsx
│   │   ├── Login.jsx
│   │   ├── Register.jsx
│   │   ├── CreateBlog.jsx
│   │   ├── MyBlogs.jsx
│   │   ├── EditBlog.jsx
│   │   ├── ViewBlog.jsx
│   │   ├── AdminDashboard.jsx
│   │   ├── About.jsx
│   │   └── Contact.jsx
│   ├── utils/               # Utility functions
│   │   ├── api.js           # API client (axios)
│   │   └── tokenUtils.js    # JWT token utilities
│   ├── App.jsx              # Main app component
│   └── main.jsx             # Entry point
│
├── package.json             # Frontend dependencies
├── vite.config.js           # Vite configuration
├── .env                     # Frontend env (optional)
├── README.md                # This file
└── MONGODB_SETUP.md         # MongoDB setup guide
```

## 🔧 API Endpoints

### Authentication
- `POST /api/auth/register` - Register new user
- `POST /api/auth/login` - Login user

### Blogs
- `GET /api/blogs` - Get all blogs (with optional search & category filters)
- `GET /api/blogs/:id` - Get single blog
- `POST /api/blogs` - Create blog (Protected)
- `PUT /api/blogs/:id` - Update blog (Protected - Owner/Admin)
- `DELETE /api/blogs/:id` - Delete blog (Protected - Owner/Admin)
- `GET /api/blogs/user/:userId` - Get blogs by user
- `GET /api/blogs/categories/list` - Get all categories

## 🔐 Authentication Flow

1. User registers/logs in via frontend
2. Backend validates credentials
3. Backend returns JWT token
4. Frontend stores token in localStorage
5. Token is sent with every API request in Authorization header
6. Backend middleware validates token on protected routes

## 📝 Environment Variables

### Backend (.env)
```env
MONGODB_URI=mongodb+srv://username:password@cluster.mongodb.net/blog-db?retryWrites=true&w=majority
JWT_SECRET=your-super-secret-key-change-in-production
JWT_EXPIRE=7d
PORT=5000
NODE_ENV=development
```

### Frontend (.env)
```env
VITE_API_URL=http://localhost:5000/api
```

## 🛠️ Technologies Used

### Frontend
- React 18
- React Router DOM v6
- Axios (HTTP client)
- Context API (State management)
- Vite (Build tool)

### Backend
- Node.js
- Express.js
- MongoDB Atlas (Cloud Database)
- Mongoose (ODM)
- JWT (Authentication)
- bcryptjs (Password hashing)
- CORS (Cross-Origin Resource Sharing)

## 📚 How It Works

### Data Flow

1. **User Actions** → Frontend components
2. **API Calls** → Axios sends requests to backend
3. **Backend Routes** → Express routes handle requests
4. **Authentication** → JWT middleware validates tokens
5. **Database** → Mongoose queries MongoDB Atlas
6. **Response** → JSON data sent back to frontend
7. **State Update** → React Context updates UI

### Security Features

- ✅ Passwords hashed with bcryptjs
- ✅ JWT tokens for authentication
- ✅ Protected routes (middleware)
- ✅ Role-based access control
- ✅ Input validation
- ✅ CORS configured

## 🐛 Troubleshooting

### Backend Issues

**MongoDB Connection Failed**
- Check MongoDB Atlas connection string in `.env`
- Verify IP address is whitelisted
- Check username/password are correct
- Ensure cluster is running

**Port Already in Use**
- Change `PORT` in `.env` file
- Or kill process using port 5000

### Frontend Issues

**API Connection Failed**
- Ensure backend server is running
- Check `VITE_API_URL` in `.env` matches backend URL
- Check browser console for CORS errors

**Authentication Not Working**
- Clear localStorage and try logging in again
- Check JWT_SECRET matches in backend
- Verify token is being sent in requests

## 📖 Code Documentation

- All code is well-commented with JSDoc-style comments
- Component-level documentation
- Function parameter descriptions
- Clear variable naming

## 🚢 Deployment

### Backend Deployment (Example: Heroku/Railway)
1. Set environment variables on hosting platform
2. Ensure MongoDB Atlas allows connections from hosting IP
3. Deploy backend code

### Frontend Deployment (Example: Vercel/Netlify)
1. Build: `npm run build`
2. Set environment variable: `VITE_API_URL` to backend URL
3. Deploy `dist` folder

## ⚠️ Important Notes

- ⚠️ Change default admin password in production
- 🔒 Use strong JWT_SECRET in production
- 🌐 Whitelist specific IPs in MongoDB Atlas (not `0.0.0.0/0`)
- 🛡️ Enable MongoDB Atlas additional security for production
- 📝 Never commit `.env` files to Git

## 📄 License

This project is created for academic purposes.

Blog Website Application with MongoDB Atlas

---

**Need help?** Check `MONGODB_SETUP.md` for detailed MongoDB setup instructions.
