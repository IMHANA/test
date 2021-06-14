class User1 {
    constructor() {
        this.name = 'hana';
        this.age = 30;
    }
    get_message() {
        return 'Hi!!';
    }
};

const hana = new User1();
console.log(typeof hana, hana.name, hana.age, hana.get_message());


class Animal {
    constructor(name) {
        this.name = name;
    }
}

class User extends Animal {
    constructor(name, age) {
        super(name);
        this.age = age;
    }
}

const hanadul = new User('hana', 30);
console.log(hanadul.name, hanadul.age);

class Animal2 {
    constructor(name) {
        this.name = name;
    }

    get_message() {
        return 'Hello';
    }
}

class User2 extends Animal2 {
    constructor(name, age) {
        super(name);
        this.age = age;
    }
    get_message() {
        return 'Hello!!!!!';
    }
}
const hana2 = new User2('hanadul', 35);
console.log(hana2.name, hana2.age, hana2.get_message());

class test {
    constructor(name) {
        this.name = name;
    }
    get_message() {
        return 'Hello';
    }
}

test.prototype.age = 100;

const dul = new test('HANA');
console.log(dul.hasOwnProperty('name'));
console.log(dul.hasOwnProperty('age'));
