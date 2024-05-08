class MessageSend {
    constructor(m_id , sender, receiver, receiver_num, message_id, message) {
        this.m_id = m_id;
        this.sender = sender;
        this.receiver = receiver;
        this.receiver_num = receiver_num;
        this.message_id = message_id;
        this.message = message;
        this.timestamp = new Date().toISOString();
    }
}

module.exports = MessageSend;