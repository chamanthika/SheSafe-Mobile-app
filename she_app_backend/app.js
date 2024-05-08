const express = require('express');
const { ref, push, onValue } = require('firebase/database');
const { app: firebaseApp, database } = require('./firebaseAdmin');
const session = require('express-session');
require('dotenv').config();

const adminStaffRoute = require('./routes/Admin_staff');
const userRoute = require('./routes/Users');
const emContactRoute = require('./routes/Emergency_contacts');
const preDefineRoute = require('./routes/Pre_define_alerts');
const callRecordsRoute = require('./routes/Call_records');
const emergencyTextRoute = require('./routes/EmergencyText');
const complainRoute = require('./routes/Complain');

const app = express();

const generateSecretKey = () => {
  return process.env.SECRET_KEY;
};


app.use(session({
  secret: generateSecretKey(),
  resave: true,
  saveUninitialized: true,
  cookie: { secure: true }
}));

// Middleware to parse JSON bodies
app.use(express.json());

app.use('/staff', adminStaffRoute);
app.use('/users', userRoute);
app.use('/em_Contacts', emContactRoute);
app.use('/pre_define_alerts', preDefineRoute);
app.use('/call_records', callRecordsRoute);
app.use('/emergency_text', emergencyTextRoute);
app.use('/complain', complainRoute);


// Start the server
const PORT = process.env.PORT || 3000;
app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});
