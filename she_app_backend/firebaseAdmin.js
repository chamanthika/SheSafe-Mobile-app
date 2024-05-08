const { ref, onValue } = require('firebase/database');
const { initializeApp } = require("firebase/app");
const { getDatabase } = require('firebase/database');
const fs = require('fs');

// Read Firebase configuration from JSON file
const firebaseConfig = JSON.parse(fs.readFileSync('./key/shecode-1ef04-firebase-adminsdk-9jzlx-4ac3a00423.json'));

// Initialize Firebase
const app = initializeApp(firebaseConfig);
const database = getDatabase(app);

// Monitor database connection
onValue(ref(database, '.info/connected'), (snapshot) => {
  if (snapshot.val() === true) {
    console.log('Database connection successful!');
  } else {
    console.log('Database connection lost!');
  }
});

// Export the initialized Firebase app and database instance
module.exports = {
  app,
  database
};
