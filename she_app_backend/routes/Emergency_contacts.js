const express = require('express');
const { randomBytes } = require('crypto');
const axios = require('axios');
const fs = require('fs');
const { set, get, ref, push, update, remove, onValue, getDatabase, equalTo, query } = require('firebase/database');
const { database } = require('../firebaseAdmin');
const EmergencyContact = require('../models/emergency_contact');
const CallHistory = require('../models/call_history');

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


// Create a new emergency contact
router.post('/saveContacts', async (req, res) => {
  try {
    var c_id = generateUUID();
    const { f_name, l_name, mobile, user_id } = req.body;
    let user_id_process = encodeEmail(user_id);

    const newEmergencyContact = new EmergencyContact(c_id, f_name, l_name, mobile, user_id);
    const emergencyContactsRef = ref(database, `emergencyContacts/${user_id_process}/${c_id}`);

    await set(emergencyContactsRef, newEmergencyContact);
    res.status(201).json({ message: 'Emergency contact created successfully' });
  } catch (error) {
    console.error('Error creating emergency contact:', error);
    res.status(500).json({ error: 'Error creating emergency contact' });
  }
});

// Get a single emergency contact by ID
router.get('/emergencyContacts/:id', async (req, res) => {
  try {
    const emergencyContactId = req.params.id;
    const emergencyContactRef = ref(database, `emergencyContacts/${emergencyContactId}`);
    onValue(emergencyContactRef, (snapshot) => {
      const data = snapshot.val();
      res.json(data);
    });
  } catch (error) {
    console.error('Error retrieving emergency contact:', error);
    res.status(500).json({ error: 'Error retrieving emergency contact' });
  }
});

//single user s all contacts
router.post('/singleUserContacts/:user_id', async (req, res) => {
  try {
    const user_id_process = encodeEmail(req.params.user_id);
    const emergencyContactsRef = ref(database, `emergencyContacts/${user_id_process}`);
    // Get the emergency contacts data from the database
    const snapshot = await get(emergencyContactsRef);
    const emergencyContactsData = snapshot.val();

    // Send the retrieved data back as a JSON response
    res.status(200).json(emergencyContactsData);
  } catch (error) {
    console.error('Error retrieving user contacts:', error);
    res.status(500).json({ error: 'Error retrieving user contacts' });
  }
});

// Update an existing emergency contact
router.put('/emergencyContacts/:id', async (req, res) => {
  try {
    const emergencyContactId = req.params.id;
    const updatedEmergencyContact = req.body;
    const emergencyContactRef = ref(database, `emergencyContacts/${emergencyContactId}`);
    await update(emergencyContactRef, updatedEmergencyContact);
    res.json({ message: 'Emergency contact updated successfully' });
  } catch (error) {
    console.error('Error updating emergency contact:', error);
    res.status(500).json({ error: 'Error updating emergency contact' });
  }
});

// Delete an emergency contact
router.delete('/deleteEmergencyContact/:user_id/:id', async (req, res) => {
  try {
    const emergencyContactId = req.params.id;
    const user_id_process = encodeEmail(req.params.user_id);
    const database = getDatabase();
    const emergencyContactRef = ref(database, `emergencyContacts/${user_id_process}/${emergencyContactId}`);

    // Remove the emergency contact node from the database
    await remove(emergencyContactRef);

    res.status(200).json({ message: 'Emergency contact deleted successfully' });
  } catch (error) {
    console.error('Error deleting emergency contact:', error);
    res.status(500).json({ error: 'Error deleting emergency contact' });
  }
});

router.post('/loadPoliceStation', async (req, res) => {
  try {
    const { latitude, longitude } = req.body;

    const url = `https://nominatim.openstreetmap.org/reverse?format=json&lat=${latitude}&lon=${longitude}&zoom=18&addressdetails=1`;
    const response = await axios.get(url);

    if (response.status === 200) {
      const jsonResponse = response.data;
      var postal_code = jsonResponse.address.postcode;

      const policeStationsData = fs.readFileSync('./police_station_data.json');
      const policeStations = JSON.parse(policeStationsData);

      let foundStation = false;

      for (const station of policeStations) {
        if (station.postalCode === postal_code) {
          foundStation = true;
          res.status(200).json({ station });
          return;
        }
      }

      if (!foundStation) {
        res.status(200).json({
          "name": "Police Emergency Number",
          "contact": "119",
          "postalCode": "00100"
        });
      }

    } else {
      console.error('Error:', response.statusText);
    }
  } catch (error) {
    console.error('Error:', error.message);
    res.status(500).json({ error: 'Internal Server Error' });
  }
});

router.post('/callDataSave', async (req, res) => {
  try {
    var c_id = generateUUID();
    const { user_id, call_to, type } = req.body;
    let user_id_process = encodeEmail(user_id);

    const emergencyContactsRef = ref(database, `call_history/${user_id_process}/${c_id}`);
    const callEntry = new CallHistory(user_id, c_id, call_to, type, new Date());

    await set(emergencyContactsRef, callEntry);
    res.status(200).json({ message: 'Call History successfully' });
  } catch (error) {
    console.error('Error saving call:', error);
    res.status(500).json({ error: 'Error saving call' });
  }
});

module.exports = router;
