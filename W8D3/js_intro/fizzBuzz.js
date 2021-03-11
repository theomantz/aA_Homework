function fizzBuzz(array){
    function isFactor(num, factor) {
        if (num % factor === 0){
            return true;
        }

        return false
    }
    function oneTrue(num) {
        let three = isFactor(num, 3);
        let five = isFactor(num, 5);
        return ( ( three || five ) && ( !three || !five) )
    }
    console.log(array.filter(oneTrue))
}

fizzBuzz([12, 5, 8, 130, 44])