console.log('안녕안녕');
setTimeout(() => {
    console.log('출력해주세오');
}, 3000);
console.log('Hana');


console.log('안녕안녕');
function desc(callback) {
    setTimeout(() => {
    console.log('하나입니다.');
    callback();
    }, 3000);
}

function desc2() {
    console.log('둘입니다.');
}

desc(desc2);
