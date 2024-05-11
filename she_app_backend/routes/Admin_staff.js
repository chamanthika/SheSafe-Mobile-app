//done by MGJC RANAWEERA    - INDEX -24466

const express = require('express');
const { ref, push, update, remove, onValue } = require('firebase/database');
const { database } = require('../firebaseAdmin');
const Staff = require('../models/staff'); 

const router = express.Router();

// Get all admin_staff
router.get('/saveStaff', (req, res) => {
  const adminStaffRef = ref(database, 'admin_staff');
  onValue(adminStaffRef, (snapshot) => {
    const data = snapshot.val();
    res.json(data);
  });
});

// Get a specific admin_staff by ID
router.get('/:id', (req, res) => {
  const adminStaffId = req.params.id;
  const adminStaffRef = ref(database, `admin_staff/${adminStaffId}`);
  onValue(adminStaffRef, (snapshot) => {
    const data = snapshot.val();
    res.json(data);
  });
});

// Add a new admin_staff
router.post('/saveStaff', (req, res) => {
  const newAdminStaffData = req.body;
  const newAdminStaff = new Staff(
    newAdminStaffData.name,
    newAdminStaffData.email,
    newAdminStaffData.address,
    newAdminStaffData.telephoneNumber,
    newAdminStaffData.password
  );
  const adminStaffRef = ref(database, 'admin_staff');
  push(adminStaffRef, newAdminStaff)
    .then(() => {
      res.status(201).json({ message: 'Admin staff added successfully' });
    })
    .catch((error) => {
      console.error('Error adding admin staff:', error);
      res.status(500).json({ error: 'Error adding admin staff' });
    });
});

// Update an existing admin_staff
router.put('/:id', (req, res) => {
  const adminStaffId = req.params.id;
  const updatedAdminStaffData = req.body;
  const updatedAdminStaff = new Staff(
    updatedAdminStaffData.name,
    updatedAdminStaffData.email,
    updatedAdminStaffData.address,
    updatedAdminStaffData.telephoneNumber,
    updatedAdminStaffData.password
  );
  const adminStaffRef = ref(database, `admin_staff/${adminStaffId}`);
  update(adminStaffRef, updatedAdminStaff)
    .then(() => {
      res.json({ message: 'Admin staff updated successfully' });
    })
    .catch((error) => {
      console.error('Error updating admin staff:', error);
      res.status(500).json({ error: 'Error updating admin staff' });
    });
});

// Delete an admin_staff
router.delete('/:id', (req, res) => {
  const adminStaffId = req.params.id;
  const adminStaffRef = ref(database, `admin_staff/${adminStaffId}`);
  remove(adminStaffRef)
    .then(() => {
      res.json({ message: 'Admin staff deleted successfully' });
    })
    .catch((error) => {
      console.error('Error deleting admin staff:', error);
      res.status(500).json({ error: 'Error deleting admin staff' });
    });
});

module.exports = router;
