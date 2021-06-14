let testValue = 1;
console.log(typeof testValue);
const testValue2 = 1.2;
console.log(typeof testValue2)
let testSymbol1 = Symbol(1);
let testSymbol2 = Symbol(1);
console.log(typeof testSymbol1, testSymbol1);
console.log(typeof testSymbol2, testSymbol2);
console.log(testSymbol1 == testSymbol2);
console.log(testSymbol1 === testSymbol2);
let ttValue = "1";
console.log(typeof ttValue, Number(ttValue));
console.log(typeof parseInt(ttValue), Number(ttValue));
console.log(typeof String(ttValue), Number(ttValue));
console.log(typeof Boolean(0), Boolean(0));
console.log((100 + 1) * 3);
let value1 = 1;
console.log(value1++ === 2);
console.log(++value1 === 3);
let age = 19;
if (age <= 19) {
    console.log('성인입니다');
} else if (age >= 15) {
    console.log('청소년입니다');
} else {
    console.log('어린이입니다');
}

let age2 = 15;
switch (age2) {
    case 12:
        console.log('12살입니다');
        break;
    case 13:
        console.log('13살입니다');
        break;
    case 14:
        console.log('14살입니다');
        break;
    default:
        console.log('매칭되는 나이가 없습니다.');
}