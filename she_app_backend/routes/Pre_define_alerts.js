const express = require('express');
const { ref, push, update, remove, onValue, orderByChild, equalTo, query} = require('firebase/database');
const { database } = require('../firebaseAdmin');
const PreDefineAlerts = require('../models/pre_defice_alerts');

const router = express.Router();

//save alerts
router.post('/alertSave', async (req, res) => {
    try {
      const { message, user_id } = req.body;
      const newAlert = new PreDefineAlerts(message, user_id);
      const alertsRef = ref(database, 'pre_defined_alerts');
      const newAlertRef = push(alertsRef);
      await update(newAlertRef, newAlert);
      res.status(201).json({ message: 'Predefined alert created successfully' });
    } catch (error) {
      console.error('Error creating predefined alert:', error);
      res.status(500).json({ error: 'Error creating predefined alert' });
    }
});
  
// Update a predefined alert
router.put('/alertUpdate/:id', async (req, res) => {
    try {
      const alertId = req.params.id;
      const updatedAlertData = req.body;
      const alertRef = ref(database, `pre_defined_alerts/${alertId}`);
      await update(alertRef, updatedAlertData);
      res.json({ message: 'Predefined alert updated successfully' });
    } catch (error) {
      console.error('Error updating predefined alert:', error);
      res.status(500).json({ error: 'Error updating predefined alert' });
    }
});
  
// Delete a predefined alert
router.delete('/alertDelete/:id', async (req, res) => {
    try {
      const alertId = req.params.id;
      const alertRef = ref(database, `pre_defined_alerts/${alertId}`);
      await remove(alertRef);
      res.json({ message: 'Predefined alert deleted successfully' });
    } catch (error) {
      console.error('Error deleting predefined alert:', error);
      res.status(500).json({ error: 'Error deleting predefined alert' });
    }
});

// Get predefined alerts for a single user
router.get('/singleUserAlerts/:user_id', async (req, res) => {
    try {
      const user_id = req.params.user_id;
      const alertsRef = ref(database, 'pre_defined_alerts');
      const userAlertsQuery = query(alertsRef, orderByChild('user_id'), equalTo(user_id));
      onValue(userAlertsQuery, (snapshot) => {
        const data = snapshot.val();
        res.json(data);
      });
    } catch (error) {
      console.error('Error retrieving user alerts:', error);
      res.status(500).json({ error: 'Error retrieving user alerts' });
    }
});
  
module.exports = router;