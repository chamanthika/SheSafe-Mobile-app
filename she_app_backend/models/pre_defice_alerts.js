const { v4: uuidv4 } = require('uuid');

class PreDefineAlerts {
  constructor(message, user_id) {
    this._id = uuidv4();
    this._message = message;
    this._user_id = user_id;
    this._createdAt = new Date().toISOString();
  }

  get id() {
    return this._id;
  }

  set id(value) {
    this._id = value;
  }

  get message() {
    return this._message;
  }

  set message(value) {
    this._message = value;
  }

  get user_id() {
    return this._user_id;
  }

  set user_id(value) {
    this._user_id = value;
  }

  get createdAt() {
    return this._createdAt;
  }

  set createdAt(value) {
    this._createdAt = value;
  }
}

module.exports = PreDefineAlerts;
