const express = require('express');
const { ref, push, update, remove, onValue, query, orderByChild, equalTo } = require('firebase/database');
const { database } = require('../firebaseAdmin');
const CallRecords = require('../models/call_records');

const router = express.Router();

// Create a new call record
router.post('/callRecords', async (req, res) => {
    try {
        const { title, file_link, file_size, user_id } = req.body;
        const newCallRecord = new CallRecords(title, file_link, file_size, user_id);
        const callRecordsRef = ref(database, 'call_records');
        await push(callRecordsRef, newCallRecord);
        res.status(201).json({ message: 'Call record created successfully' });
    } catch (error) {
        console.error('Error creating call record:', error);
        res.status(500).json({ error: 'Error creating call record' });
    }
});

// Update an existing call record
router.put('/callRecords/:id', async (req, res) => {
    try {
        const id = req.params.id;
        const { title, file_link, file_size } = req.body;
        const updatedCallRecord = new CallRecords(title, file_link, file_size);
        const callRecordRef = ref(database, `call_records/${id}`);
        await update(callRecordRef, updatedCallRecord);
        res.json({ message: 'Call record updated successfully' });
    } catch (error) {
        console.error('Error updating call record:', error);
        res.status(500).json({ error: 'Error updating call record' });
    }
});

// Delete a call record
router.delete('/callRecords/:id', async (req, res) => {
    try {
        const id = req.params.id;
        const callRecordRef = ref(database, `call_records/${id}`);
        await remove(callRecordRef);
        res.json({ message: 'Call record deleted successfully' });
    } catch (error) {
        console.error('Error deleting call record:', error);
        res.status(500).json({ error: 'Error deleting call record' });
    }
});

// Get call records for a single user
router.get('/callRecords/user/:user_id', async (req, res) => {
    try {
        const user_id = req.params.user_id;
        const callRecordsRef = ref(database, 'call_records');
        const userCallRecordsQuery = query(callRecordsRef, orderByChild('user_id'), equalTo(user_id));
        onValue(userCallRecordsQuery, (snapshot) => {
            const data = snapshot.val();
            res.json(data);
        });
    } catch (error) {
        console.error('Error retrieving call records:', error);
        res.status(500).json({ error: 'Error retrieving call records' });
    }
});

module.exports = router;
