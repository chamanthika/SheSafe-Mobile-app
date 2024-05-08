const express = require('express');
const bcrypt = require('bcryptjs');
const { ref, child, update, remove, onValue, set, get } = require('firebase/database');
const { database } = require('../firebaseAdmin');
const User = require('../models/user');
const fs = require('fs');


const router = express.Router();

const encodeEmail = (email) => {
    return email.replace('.', '_dot_').replace('@', '_at_');
};

// Create a new user
router.post('/usersSave', async (req, res) => {
    try {
        const { email, password, tel, name, province, address } = req.body;

        const hashedPassword = await bcrypt.hash(password, 10);
        const newUser = new User(email, hashedPassword, tel, name, province, address);
        const encodedEmail = encodeEmail(email);
        const userRef = ref(database, `users/${encodedEmail}`);
        await set(userRef, newUser);
        res.status(201).json({ message: 'User created successfully' });
    } catch (error) {
        console.error('Error creating user:', error);
        res.status(500).json({ error: 'Error creating user' });
    }
});

// Get all users
router.get('/allUsers', async (req, res) => {
    try {
        const usersRef = ref(database, 'users');
        onValue(usersRef, (snapshot) => {
            const users = [];
            snapshot.forEach((childSnapshot) => {
                users.push(childSnapshot.val());
            });
            res.json(users);
        });
    } catch (error) {
        console.error('Error getting users:', error);
        res.status(500).json({ error: 'Error getting users' });
    }
});

// Get a user by ID
router.post('/singleUser', async (req, res) => {
    try {
        const { email } = req.body;
        const encodedEmail = encodeEmail(email);

        const userRef = ref(database, `users/${encodedEmail}`);
        const snapshot = await get(userRef);
        if (snapshot.exists()) {
            const userData = snapshot.val();
            res.status(200).json(userData);
        } else {
            res.status(404).json({ error: 'User not found' });
        }
    } catch (error) {
        console.error('Error retrieving user:', error);
        res.status(500).json({ error: 'Error retrieving user' });
    }
});

// Update a user
router.put('/updateUser/:email', async (req, res) => {
    try {
        const email_txt = req.params.email;
        const encodedEmail = encodeEmail(email_txt);

        const updatedUserData = req.body;
        const userRef = ref(database, `users/${encodedEmail}`);
        await update(userRef, updatedUserData);
        res.json({ message: 'User updated successfully' });
    } catch (error) {
        console.error('Error updating user:', error);
        res.status(500).json({ error: 'Error updating user' });
    }
});

// Delete a user
router.delete('/deleteUsers/:email', async (req, res) => {
    try {
        const email_txt = req.params.email;
        const encodedEmail = encodeEmail(email_txt);

        const userRef = ref(database, `users/${encodedEmail}`);
        await remove(userRef);
        res.json({ message: 'User deleted successfully' });
    } catch (error) {
        console.error('Error deleting user:', error);
        res.status(500).json({ error: 'Error deleting user' });
    }
});

router.post('/login', async (req, res) => {
    try {
        const { email, password } = req.body;
        const encodedEmail = encodeEmail(email);


        const userRef = ref(database, `users/${encodedEmail}`);
        const snapshot = await get(userRef);

        if (snapshot.exists()) {
            const userData = snapshot.val();

            const hashedPassword = userData._password;


            bcrypt.compare(password, hashedPassword, async (err, passwordMatch) => {
                if (passwordMatch) {
                    const newData = {
                        email: email,
                        timestamp: new Date().toISOString()
                    };

                    saveDataToJsonFile('data.json', newData);
                    res.status(200).json({ message: 'Login successful' });
                } else {
                    res.status(401).json({ error: 'Invalid credentials' });
                }
            });
        } else {
            res.status(404).json({ error: 'User not found' });
        }
    } catch (error) {
        console.error('Error logging in:', error);
        res.status(500).json({ error: 'Error logging in' });
    }
});

function saveDataToJsonFile(filename, newData) {
    // Read existing data from the file
    fs.readFile(filename, 'utf8', (err, data) => {
        if (err) {
            console.error("Error reading file:", err);
            return;
        }

        let existingData = [];
        if (data) {
            try {
                existingData = JSON.parse(data);
            } catch (parseErr) {
                console.error("Error parsing JSON:", parseErr);
                return;
            }
        }

        // Append new data to existing data
        existingData.push(newData);

        // Write updated data back to the file
        fs.writeFile(filename, JSON.stringify(existingData, null, 2), (writeErr) => {
            if (writeErr) {
                console.error("Error writing to file:", writeErr);
            } else {
                console.log("Data appended successfully.");
            }
        });
    });
}

router.post('/load_username', async (req, res) => {
    // if (req.session && req.session.user && req.session.user.username) {
    const username = req.session.user.username;
    res.status(200).json({ username: username });
    // } else {
    //     res.status(401).json({ error: 'User not authenticated' });
    // }
});


router.post('/passWordReset', async (req, res) => {
    try {
        const { email, newPassword } = req.body;

        // Hash the new password
        const hashedPassword = await bcrypt.hash(newPassword, 10);
        const encodedEmail = encodeEmail(email);

        // Check if the user exists
        const userRef = ref(database, `users/${encodedEmail}`);
        const snapshot = await get(userRef);

        if (snapshot.exists()) {
            // Update the password
            await update(child(userRef, 'password'), hashedPassword);
            res.status(200).json({ message: 'Password reset successfully' });
        } else {
            res.status(404).json({ error: 'User not found' });
        }
    } catch (error) {
        console.error('Error resetting password:', error);
        res.status(500).json({ error: 'Error resetting password' });
    }
});

module.exports = router;
