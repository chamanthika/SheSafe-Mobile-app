const { v4: uuidv4 } = require('uuid');

class User {
    constructor(email, password, tel, name, province, address) {
        this._id = uuidv4(); 
        this._name = name;
        this._email = email;
        this._address = address;
        this._tel = tel; 
        this._province = province; 
        this._password = password;
        this._createdAt = new Date().toISOString(); 
    }

    get id() {
        return this._id;
    }

    set id(value) {
        this._id = value;
    }

    get name() {
        return this._name;
    }

    set name(value) {
        this._name = value;
    }

    get email() {
        return this._email;
    }

    set email(value) {
        this._email = value;
    }

    get address() {
        return this._address;
    }

    set address(value) {
        this._address = value;
    }

    get tel() {
        return this._tel;
    }

    set tel(value) {
        this._tel = value;
    }

    get province() {
        return this._province;
    }

    set province(value) {
        this._province = value;
    }

    get password() {
        return this._password;
    }

    set password(value) {
        this._password = value;
    }

    get createdAt() {
        return this._createdAt;
    }
}

module.exports = User;
