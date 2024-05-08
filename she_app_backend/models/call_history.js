// callHistoryModel.js

class CallHistory {
    constructor(user_id, c_id, call_to, type, timestamp = null) {
        this.user_id = user_id;
        this.c_id = c_id;
        this.call_to = call_to;
        this.type = type;
        this.timestamp = timestamp;
    }

    getTimestamp() {
        return this.timestamp;
    }

    setTimestamp(timestamp) {
        this.timestamp = timestamp;
    }

}

module.exports = CallHistory;
