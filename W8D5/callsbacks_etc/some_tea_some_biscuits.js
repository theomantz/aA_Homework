// Require readLine Library
const readline = require('readline');

const reader = readline.createInterface({
    input: process.stdin,
    output: process.stdout,
});

// Tea and Biscuits
function teaAndBiscuits() {

    reader.question('Would you like some tea? ', (first) => {
        console.log(`You replied ${first}.`);

        reader.question('Would you like some biscuits? ', (second) => {
            console.log(`You replied ${second}`);
            console.log(`You replied ${first} then ${second}`)
            
            let reply_1 = first === 'yes' ? 'do' : 'don\'t'
            let reply_2 = second === 'yes' ? 'do' : 'don\'t'
            
            console.log(`So you ${reply_1} want tea and you ${reply_2} want biscuits.`)
            reader.close();
        });
    });

}

teaAndBiscuits();