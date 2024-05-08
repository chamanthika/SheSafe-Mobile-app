class EmergencyText {
    constructor(id, text) {
        this.id = id;
        this.text = text;
        this.createdAt = new Date().toISOString();
    }

    get id() {
        return this.id;
    }

    set id(value) {
        this.id = value;
    }

    get text() {
        return this.text;
    }

    set text(value) {
        this.text = value;
    }

    get createdAt() {
        return this.createdAt;
    }
}
module.exports = EmergencyText;