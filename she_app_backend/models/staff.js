const { v4: uuidv4 } = require('uuid');

class Staff {
  constructor(name, email, address, telephoneNumber, password) {
    this.id = uuidv4(); 
    this.name = name;
    this.email = email;
    this.address = address;
    this.telephoneNumber = telephoneNumber;
    this.password = password;
    this.createdAt = new Date().toISOString(); 
  }

  getId() {
    return this.id;
  }

  getName() {
    return this.name;
  }

  setName(name) {
    this.name = name;
  }

  getEmail() {
    return this.email;
  }

  setEmail(email) {
    this.email = email;
  }

  getAddress() {
    return this.address;
  }

  setAddress(address) {
    this.address = address;
  }

  getTelephoneNumber() {
    return this.telephoneNumber;
  }

  setTelephoneNumber(telephoneNumber) {
    this.telephoneNumber = telephoneNumber;
  }

  getPassword() {
    return this.password;
  }

  setPassword(password) {
    this.password = password;
  }

  getCreatedAt() {
    return this.createdAt;
  }
}

module.exports = Staff;
