const user = {
    age: 20,
    name: 'Hana',
    details: {
        hobby: 'coding',
        major: 'Japanese',
        get_hobby: function() {
            return this.hobby;
        }
        // arrow function은 this로 객체 불러올 수 없음
        //get_hobby: () => this.hobby;
    }
};
console.log(user.details.get_hobby());

const user1 = {
    age: 10,
    name: "Hana Dul",
    get get_age() {
        return this.age;
    },
    set set_age(value) {
        this.age = value;
    }
};

console.log(user1.get_age);
user1.set_age = 2;
console.log(user1.get_age);
