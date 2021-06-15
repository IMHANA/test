const data = [1, 2, 3, 'Hana', true];
console.log(data);
console.log(data.length);

const data1 = new Array();
data1[0] = 1;
data1[1] = 2;
console.log(data1[0], data1[1], data1[data1.length - 1]);
console.log(data1);
data1[1] = 'fun-coding';
console.log(data1);

const data2 = [1, 2, 3, 'Hana', 'fun-coding'];
console.log(data2);
data2.splice(1, 3);
console.log(data2);

const data01 = [1, 2, 'Hana', null];

const data02 = [
    { name: 'Hana', age: 30 },
    { name: 'Alex', age: 40 }
];

const data03 = [
    [1, 2, 3],
    [4, 5, 6]
];

console.log(data01[0]);
console.log(data02[0].name);
console.log(data03[0][2]);
