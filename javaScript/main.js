const myArray = [1, 2];

if (myArray.length === 0) {
    console.log('빈 배열입니다.')
} else {
    console.log('배열에 값이 있습니다.')
}
myArray.length === 0 ? console.log('빈 배열'):console.log('배열에 값이 있음');

function printData(item, name='Hana') {
    console.log(item, name);
}
printData(1);

const data = {
    name: "Hana",

    hobby: 'coding'
};

let { name:myName, age:myAge=25, special='python' } = data;
console.log(myName, myAge, special);

let data2 = [1, 2, 3];

const [item3, item4, item5, item6="Hana"] = data2;

console.log(item3, item4, item5, item6);