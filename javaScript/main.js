const runCode = new Promise(
    // function (resolve, reject) {
    (resolve, reject) => {
        setTimeout(() => {
            let num = {};
            if(num > 11) {
                resolve(num);
            } else {
                reject('this is an error');
            }
        }, 1000);
    }
);

runCode.then((item) => {
    console.log('success', item);
    }, (err) => {
        console.log(err);
    }).then(() => {
        console.log('by duldul');
    }, () => {
        console.log('error2');
    });

    console.log('dul');