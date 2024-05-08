const express = require('express');
const { ref, push, update, remove, onValue, orderByChild, equalTo, query } = require('firebase/database');
const { database } = require('../firebaseAdmin');
const CallRecords = require('../models/calls');

const router = express.Router();

// Create a new call record
router.post('/callRecords', async (req, res) => {
  try {
    const { call_type, call_to, start_time, end_time, user_id } = req.body;
    // Create a new call record instance
    const newCallRecord = new CallRecords(call_type, call_to, start_time, end_time, user_id);
    // Save the call record to the database
    const callRecordsRef = ref(database, 'call_records');
    const newCallRecordRef = push(callRecordsRef);
    await update(newCallRecordRef, newCallRecord);
    res.status(201).json({ message: 'Call record created successfully' });
  } catch (error) {
    console.error('Error creating call record:', error);
    res.status(500).json({ error: 'Error creating call record' });
  }
});

// Update an existing call record by ID
router.put('/callRecords/:id', async (req, res) => {
  try {
    const callRecordId = req.params.id;
    const { call_type, call_to, start_time, end_time, user_id } = req.body;
    // Create a new call record instance with updated data
    const updatedCallRecord = new CallRecords(call_type, call_to, start_time, end_time, user_id);
    // Update the call record in the database
    const callRecordRef = ref(database, `call_records/${callRecordId}`);
    await update(callRecordRef, updatedCallRecord);
    res.json({ message: 'Call record updated successfully' });
  } catch (error) {
    console.error('Error updating call record:', error);
    res.status(500).json({ error: 'Error updating call record' });
  }
});

// Delete an existing call record by ID
router.delete('/callRecords/:id', async (req, res) => {
  try {
    const callRecordId = req.params.id;
    // Delete the call record from the database
    const callRecordRef = ref(database, `call_records/${callRecordId}`);
    await remove(callRecordRef);
    res.json({ message: 'Call record deleted successfully' });
  } catch (error) {
    console.error('Error deleting call record:', error);
    res.status(500).json({ error: 'Error deleting call record' });
  }
});

// Get a single call record by ID
router.get('/callRecords/:id', async (req, res) => {
  try {
    const callRecordId = req.params.id;
    // Fetch the call record from the database
    const callRecordRef = ref(database, `call_records/${callRecordId}`);
    onValue(callRecordRef, (snapshot) => {
      const data = snapshot.val();
      res.json(data);
    });
  } catch (error) {
    console.error('Error retrieving call record:', error);
    res.status(500).json({ error: 'Error retrieving call record' });
  }
});

// Get call records for a single user by user ID
router.get('/userCallRecords/:user_id', async (req, res) => {
    try {
      const userId = req.params.user_id;
      const callRecordsRef = ref(database, 'call_records');
      const userCallRecordsQuery = query(callRecordsRef, orderByChild('user_id'), equalTo(userId));
      onValue(userCallRecordsQuery, (snapshot) => {
        const callRecords = snapshot.val();
        res.json(callRecords);
      });
    } catch (error) {
      console.error('Error retrieving call records for user:', error);
      res.status(500).json({ error: 'Error retrieving call records for user' });
    }
});
module.exports = router;
