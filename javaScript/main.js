let a = 1;
let b = 2;

[a, b] = [b, a];
console.log(a, b);

function getData() {
    return [10, 20];
}

let [c, d, e] = getData();
console.log(c, d, e);

let data = 'Hana Im, fun-coding, coding';
let [name, brand, hobby] = data.split(',');

console.log(data.split(','));
console.log(name, brand);


function getData2(a, b, ...rest) {
    console.log(rest);
}

getData2(1, 2, 3, 4, 5);

const data3 = [1, 2, 3];

console.log(data3);
console.log(...data3);

function func(a, b, c, d) {
    console.log(b, c);
}

const data4 = [1, 2, 3, 4];
func(...data4);

const data01 = [1, 2, 3];
const data02 = [0, ...data01, 4, 5];

console.log(data02);