const data = [1, 2, 3];
data.push(5);
console.log(data);
data.push('Hana');
console.log(data);
console.log(data.pop());
console.log(data);
data.shift();
console.log(data);

const data1 = [1, 2];
const data2 = ['Hana', 'dul'];
let conData = data1.concat(data2);
console.log(conData);

let jdata = conData.join('*');
console.log(jdata, typeof jdata);
conData.reverse();
console.log(conData);

const data3 = [1, 2, 3, 4, 5, 6];
let data4 = data3.slice(1, 3);
console.log(data4);
data3.forEach(item => {
    console.log(item);
});

const datamap = data3.map(item => item * 2);
console.log(datamap);
console.log(datamap.indexOf(6));

const myArray3 = [
    {
        id: 1,
        name: 'Hana Im'
    },
    {
        id: 2,
        name: 'Alex'
    }
];

console.log(myArray3.indexOf('Alex'));
console.log(myArray3.findIndex(item => item.name === 'Alex'));
console.log(myArray3.find(item => item.name === 'Alex'));

let myArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
let even = myArray.filter(item => item % 2 === 0);
console.log(even, typeof even);