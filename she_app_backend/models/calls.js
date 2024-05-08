const { v4: uuidv4 } = require('uuid');

class Call {
  constructor(call_type, call_to, start_time, end_time, user_id) {
    this.id = uuidv4(); 
    this.call_type = call_type;
    this.call_to = call_to;
    this.start_time = start_time;
    this.end_time = end_time;
    this.user_id = user_id;
    this.timestamp = new Date().toISOString();
  }

  getId() {
    return this.id;
  }

  getCallType() {
    return this.call_type;
  }

  setCallType(call_type) {
    this.call_type = call_type;
  }

  getCallTo() {
    return this.call_to;
  }

  setCallTo(call_to) {
    this.call_to = call_to;
  }

  getStartTime() {
    return this.start_time;
  }

  setStartTime(start_time) {
    this.start_time = start_time;
  }

  getEndTime() {
    return this.end_time;
  }

  setEndTime(end_time) {
    this.end_time = end_time;
  }

  getUserId() {
    return this.user_id;
  }

  setUserId(user_id) {
    this.user_id = user_id;
  }

  getTimestamp() {
    return this.timestamp;
  }
}

module.exports = CallRecords;
