function fizzBuzzTs(n: number): void {
    for (let i=0; i<n; i++) {
        switch (true){
            case i%15==0:
                console.log("FizzBuzz")
                break;
            case i%5==0:
                console.log("Buzz")
                break;
            case i%3==0:
                console.log("Fizz")
                break;
            default:
                console.log(i)
                break;
        } 
    }
}

import * as readline from "readline";

// Create an interface for reading lines
const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

// Ask the user for input
rl.question('Input angka: ', (numStr: string) => {
    const num = parseInt(numStr)
    fizzBuzzTs(num);

  // Close the readline interface
  rl.close();
});
