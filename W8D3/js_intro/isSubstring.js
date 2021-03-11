// Weird splitting searchstring method and outputting true if count > 0
// function isSubstring(searchString, subString) {
//     searchArray = searchString.split(' ');
//     let count = 0;
//     for(index = 0; index < searchArray.length; index++){
//         if(searchArray[index] === subString){
//             count++
//         }
//     }
//     if(count) {
//         console.log(true)
//     } else {
//         console.log(count || false)
//     }
// }

// Second method using indexOF

// function isSubstring(searchString, subString) {
//     let ret = searchString.indexOf(subString) !== -1;
//     console.log(ret);
// }

function isSubstring(searchString, subString) {
    ret = searchString.match(RegExp(`${subString}`));
    console.log(ret !== null);
    console.log(ret);
}


isSubstring("time to program", "time")
isSubstring("time to program", "beans")
isSubstring("Jump for joy", "joys")