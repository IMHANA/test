function FunCoding(name) {
    console.log(name);
}
FunCoding('hana');

function FunCoding2(name) {
    return 'Hi! ' + name;
}
console.log(FunCoding2('Hana'));

let func = (name) => console.log(name + ' yes!');
func('Hana');

let f1 = () => "Hello !!";
f1();

let f2 = age => age * 2;
console.log(f2(1));
f2();

let f3 = (item1, item2) => {
    return item1 * item2;
}
console.log(f3(1, 3));

let f3_1 = (item1, item2) => item1 * item2;
console.log(f3_1(1, 4));
