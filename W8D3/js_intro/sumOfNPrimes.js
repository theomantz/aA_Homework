function isPrime(num) {
    for(let i = 2; i < num; i++){
        if(num % i === 0) {
            return false;
        } 
    }
    return num > 1;
}

function firstNPrimes(num) {
    var primesArray = [];
    if(num < 2) {
        if(num === 0) return primesArray;
        if(num === 1) return [2];
    }
        for(let int = 2; primesArray.length < num ; int++) {
            if(isPrime(int)) primesArray.push(int);
        }
        return primesArray;
}

function sumOfNPrimes(num) {
    let primesArray = firstNPrimes(num);
    let acc = 0
    for(let i = 0 ; i < primesArray.length ; i++ ){
        acc += primesArray[i]
    }
    console.log(acc)
}


// isPrime(2)
// // true
// isPrime(10)
// //  false
// isPrime(15485863)
// //  true
// isPrime(3548563)
// //  false

// firstNPrimes(5)

sumOfNPrimes(0)
// 0

sumOfNPrimes(1)
// 2

sumOfNPrimes(4)
// 17