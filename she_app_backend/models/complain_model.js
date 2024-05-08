class Complain {
    constructor(user_id, c_id, timestamp) {
        this.user_id = user_id;
        this.c_id = c_id;
        this.timestamp = timestamp;
    }

    setTimestamp(timestamp) {
        this.timestamp = timestamp;
    }

}

module.exports = Complain;
