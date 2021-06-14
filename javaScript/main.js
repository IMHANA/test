function User(age, name) {
    this.age = age;
    this.name = name;
    this.get_data = function() {
        return this.age;
    }
}
const hana = new User(10, 'Hana');
console.log(typeof hana);
console.log(hana.age, hana.get_data());

function User1(age, name) {
    this.age = age;
    this.name = name;
};

User1.prototype.message = function() {
    return 'Yes!!!';
}

User1.prototype.hobby = 'coding';

const hanadul = new User1(11, 'HANA');
console.log(hanadul.age, hanadul.name, hanadul.hobby);
console.log(hanadul.message());