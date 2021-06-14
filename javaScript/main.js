for (let i = 0; i < 5; i++) {
    console.log(i);
}
console.log('end');

const data = ['Hana', 30, true];
for (let i = 0; i < data.length; i++) {
    console.log(typeof data[i], data[i]);
}

const data2 = ['Hana', 30, true];
for(let item of data2) {
    console.log(item);
}

const data3 = {
    name: 'Hana',
    age: 20,
    brand: "fun-coding",
    get_message: function() {
        return 'Hello !!'
    }
}
for (let property in data3) {
    console.log(property, data3[property]);
}

// console.log(Object.entries(data3));
// console.log(Object.keys(data3));
// console.log(Object.values(data3));


let i = 0;
while (i < 5) {
    console.log(i);
    i++;
}

for (let i = 0; i < 5; i++) {
    if (i === 3) {
        break;
    }
    console.log(i);
}