const express = require('express');
const { randomBytes } = require('crypto');

const { set, get, ref, push, update, remove, onValue, getDatabase, equalTo, query } = require('firebase/database');
const { database } = require('../firebaseAdmin');
const EmergencyText = require('../models/emergency_text');
const MessageSend = require('../models/message_send');

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

router.post('/saveEmergencyText', async (req, res) => {
    try {
        const { text } = req.body;
        const uuid = generateUUID();
        const emergencyTextRef = ref(database, `emergency_texts/${uuid}`);

        await set(emergencyTextRef, {
            text: text,
            id: uuid
        });
        res.status(201).send({ message: 'Emergency Text saved successfully', id: uuid });
    } catch (error) {
        console.error('Error creating EmergencyText:', error);
        res.status(500).send('Internal Server Error');
    }
});

router.get('/getAllText', async (req, res) => {
    try {
        const emergencyTextRef = ref(database, `emergency_texts`);
        onValue(emergencyTextRef, (snapshot) => {
            const data = snapshot.val();
            res.status(200).json(data);
        });
    } catch (error) {
        console.error('Error fetching EmergencyTexts:', error);
        res.status(500).send('Internal Server Error');
    }
});


router.post('/sendTextMsg', async (req, res) => {
    try {
        const { msg_list, contact_list, user_id } = req.body;

        for (let i = 0; i < contact_list.length; i++) {
            for (let j = 0; j < msg_list.length; j++) {
                const m_id = generateUUID();
                const msg_ob = new MessageSend(
                    m_id,
                    user_id,
                    contact_list[i]['id'],
                    contact_list[i]['mobile'],
                    msg_list[j]['id'],
                    msg_list[j]['text']
                );
                const emergencyTextRef = ref(database, `emergency_msg_send/${encodeEmail(user_id)}/${m_id}`);

                await set(emergencyTextRef, msg_ob);
            }
        }
        res.status(201).json({ message: 'Emergency Text saved successfully' });

    } catch (error) {
        console.error('Error fetching EmergencyTexts:', error);
        res.status(500).send('Internal Server Error');
    }
});


module.exports = router;
