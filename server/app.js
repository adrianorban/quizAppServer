const express = require("express");
const mysql = require("mysql2");
const cookieParser = require("cookie-parser");
const passport = require("passport");
const session = require("express-session");
const GoogleStrategy = require("passport-google-oauth20").Strategy;
const jwt = require("jsonwebtoken");
const { read } = require('./utils/secrets');
const db = require("./dbConnection")

const app = express();

const feAppDomain = "http://localhost:3000"

if (!process.env.NODE_ENV || process.env.NODE_ENV === 'local') {
    const cors = require("cors");
    const dotenv = require("dotenv");

    dotenv.config({
        path: "./.env"
    })

    //for CORS
    let corsOptions = {
        // origin: process.env.WEB_APP_URL,
        // credentials:  true
        origin: [feAppDomain],
        credentials:  true,
        sameSite: 'none'
    }
    app.use(cors(corsOptions));
}

//middlewares
//for form
app.use(express.urlencoded({extended: false}));
//for json
app.use(express.json());
//for cookies
app.use(cookieParser());

app.use(session({
    secret: process.env.SESSION_SECRET,
    resave: false,
    saveUninitialized: true,
  }));
  
  app.use(passport.initialize());
  app.use(passport.session());


passport.use(
    new GoogleStrategy(
      {
        clientID: process.env.GOOGLE_CLIENT_ID,
        clientSecret: process.env.GOOGLE_CLIENT_SECRET,
        callbackURL: "/auth/google/callback",
      },
      (accessToken, refreshToken, profile, done) => {
        console.log("stragegy google ---", process.env.GOOGLE_CLIENT_ID)
        return done(null, profile);
      }
    )
  );
  
// Serialize & Deserialize User
passport.serializeUser((user, done) => done(null, user));
passport.deserializeUser((obj, done) => done(null, obj));

// Google Auth Route
app.get("/auth/google", passport.authenticate("google", { scope: ["profile", "email"] }));

app.get(
  "/auth/google/callback",
  passport.authenticate("google", { failureRedirect: feAppDomain + "/login" }),
  (req, res) => {
    console.log(req.user.id)
    const googleId = req.user.id;
    db.connection.query('SELECT * FROM users WHERE google_id = ?', [googleId],  (error, results) => {
        console.log("select from db google id")
        if(error) {
            console.log("Error select DB")
            console.log(error)
            res.status(200).json({
                success: false,
                errorMsg: "An error occured. Try again later"
            });
        }
        console.log(results);
        if(!results || results.length === 0) {
            console.log("write google user in users-----");
            db.connection.query("INSERT INTO users SET ?", {
                name: req.user.displayName, 
                google_id: req.user.id,
                email: req.user.emails[0].value, 
                password: req.user.id,
                isActive: true,
                coins: 0
            }, (error, results) => {
                if(error) {
                    console.log(error)
                } else {
                    console.log(results)
                        const token = jwt.sign({ _id: results.insertId, _name:req.user.displayName, _email:req.user.emails[0].value}, read('jwt-token'));
                        res.cookie("authToken", token, {
                            maxAge: 1000 * 60 * 60 * 24,
                            httpOnly: true,
                            secure: process.env.NODE_ENV === "production"
                        });
                        res.redirect(feAppDomain + "/dashboard"); // Redirect to frontend
                }
            })

        } else {
          const token = jwt.sign({ _id: results[0].id, _name:results[0].name, _email:results[0].email}, read('jwt-token'));
          res.cookie("authToken", token, {
              maxAge: 1000 * 60 * 60 * 24,
              httpOnly: true,
              secure: process.env.NODE_ENV === "production"
          });
          res.redirect(feAppDomain + "/dashboard"); // Redirect to frontend
        }
    });
  }
);

//route middlewares
app.use('/api/auth/', require("./api/authPaths"));
app.use('/api/test/', require("./api/testPaths"));
app.use('/api/', require("./api/profilePaths"));

app.listen(5001, () => {
    console.log("Server running on 5001")
})