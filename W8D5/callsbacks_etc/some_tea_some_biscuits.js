// Require readLine Library

const readline = require('readline');

const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

// Tea and Biscuits
function teaAndBiscuits() {
    let first, second;

    reader.question('Would you like some tea?', (res) => {
        first = res;
        console.log(`You replied ${first}`)
    });

    reader.close()
}