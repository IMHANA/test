// Promise 객체 생성
const promise = new Promise((resolve, reject) => {
    // 비동기 작업 수행
    setTimeout(() => {
        let num = 10;
        if (num >= 11) {
            /* 비동기 작업 성공 */
            resolve(num);
        } else {
            /* 비동기 작업 실패 */
            reject('this is an error');
        }
    }, 500);
});

promise
    .then((num) => {
        console.log('success', num);
        return 2;  /* return 값이 다음 then의 인자로 넘어가짐 */
    })
    .then((num) => {
        console.log('success2', num);
    })
    .finally(() => {
        console.log('finally');
    })
    .catch((err) => {
        console.log('error');
    });

const promise1 = new Promise((resolve, reject) => {
    setTimeout(() => {
        console.log('100ms');
        resolve('100ms')
    }, 100);
});

const promise2 = new Promise((resolve, reject) => {
    setTimeout(() => {
        console.log('500ms');
        resolve('500ms')
    }, 500);
});

const promise3 = new Promise((resolve, reject) => {
    setTimeout(() => {
        console.log('1500ms');
        resolve('1500ms')
    }, 500);
});

Promise.race([promise1, promise2, promise3]).then((data) => {
    console.log('race',data);
});