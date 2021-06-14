const emptyObject = {};

emptyObject.name = "HANA";
emptyObject.age = 10;
emptyObject.get_data = function() {
    return 1 + 2;
}

console.log(emptyObject.age, emptyObject.get_data());

const user = {
    age: 20,
    name: "Hana",
    get_data: function() {
        return 1 + 2;
    }
};

console.log(user);
console.log(typeof user, user);
console.log(user.age);
console.log(user.name);
user.age = 25;
console.log(user.age);
console.log(user.get_data());

const user2 = {
    age: 10,
    name: "HanaDul",
    details: {
        hobby: "coding",
        major: "japanese",
        get_details: function (item) {
            return item * 2;
        }
    }
};

console.log(user2.age, user2.name);
console.log(user2.details.hobby, user2.details.major, user2.details.get_details);
