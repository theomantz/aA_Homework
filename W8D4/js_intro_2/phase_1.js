function titleize(array, callback) {
    newArr = array.map(
        el => `Mx. ${el} Jingleheimer Schmidt`
        );
        newArr.forEach(el => callback(el) );
}

function printCallback(name){
    console.log(name);
}

titleize(["Mary", "Brian", "Leo"], printCallback);
// Mx. Mary Jingleheimer Schmidt
// Mx. Brian Jingleheimer Schmidt
// Mx. Leo Jingleheimer Schmidt