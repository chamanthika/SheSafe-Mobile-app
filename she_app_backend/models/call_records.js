const { v4: uuidv4 } = require('uuid');

class CallRecords {
  constructor(title, file_link, file_size, user_id) {
    this.id = uuidv4();
    this.title = title;
    this.file_link = file_link;
    this.file_size = file_size;
    this.user_id = user_id;
    this.timestamp = Date.now(); 
  }

  // Getters and setters
  getId() {
    return this.id;
  }

  getTitle() {
    return this.title;
  }

  setTitle(title) {
    this.title = title;
  }

  getFileLink() {
    return this.file_link;
  }

  setFileLink(file_link) {
    this.file_link = file_link;
  }

  getFileSize() {
    return this.file_size;
  }

  setFileSize(file_size) {
    this.file_size = file_size;
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
