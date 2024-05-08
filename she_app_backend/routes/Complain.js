const express = require('express');
const { randomBytes } = require('crypto');
const axios = require('axios');
const fs = require('fs');
const { set, get, ref, push, update, remove, onValue, getDatabase, equalTo, query } = require('firebase/database');
const { database } = require('../firebaseAdmin');
const Complain = require('../models/complain_model');


const router = express.Router();

const generateUUID = () => {
    const bytes = randomBytes(16);
    bytes[6] = (bytes[6] & 0x0f) | 0x40;
    bytes[8] = (bytes[8] & 0x3f) | 0x80;
    return bytes.toString('hex');
};

const encodeEmail = (email) => {
    return email.replace('.', '_dot_').replace('@', '_at_');
};

router.post('/saveComplain', async (req, res) => {
    try {
        var c_id = generateUUID();
        const { user_id } = req.body;
        let user_id_process = encodeEmail(user_id);
        const complainRef = ref(database, `complain/${user_id_process}/${c_id}`);

        const now = new Date();
        const year = now.getFullYear();
        const month = String(now.getMonth() + 1).padStart(2, '0');
        const day = String(now.getDate()).padStart(2, '0');
        const hours = String(now.getHours()).padStart(2, '0');
        const minutes = String(now.getMinutes()).padStart(2, '0');
        const seconds = String(now.getSeconds()).padStart(2, '0');

        const timestamp = `${year}-${month}-${day} ${hours}:${minutes}:${seconds}`;

        const complainEntry = new Complain(user_id, c_id, timestamp);
        await set(complainRef, complainEntry);
        res.status(200).json({ message: 'Complain saved successfully' });
    } catch (error) {
        console.error('Error creating complain:', error);
        res.status(500).json({ error: 'Error creating complain ' });
    }
});

module.exports = router;