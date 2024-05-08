

class EmergencyContact {
  constructor(id, f_name, l_name, mobile, user_id) {
    this.id = id;
    this.f_name = f_name;
    this.l_name = l_name;
    this.mobile = mobile;
    this.user_id = user_id;
    this.createdAt = new Date().toISOString();
  }

  getId() {
    return this.id;
  }

  getFirstName() {
    return this.f_name;
  }

  setFirstName(f_name) {
    this.f_name = f_name;
  }

  getLastName() {
    return this.l_name;
  }

  setLastName(l_name) {
    this.l_name = l_name;
  }

  getMobile() {
    return this.mobile;
  }

  setMobile(mobile) {
    this.mobile = mobile;
  }

  getUserId() {
    return this.user_id;
  }

  setUserId(user_id) {
    this.user_id = user_id;
  }

  getCreatedAt() {
    return this.createdAt;
  }
}

module.exports = EmergencyContact;
