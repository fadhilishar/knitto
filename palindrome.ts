function isPalindrome(str: string): boolean {
    for (let i=0;i<str.length/2;i++){
        if (str.charAt(i)!=str.charAt(str.length-1-i)){
            return false
        }
    }
    return true
}

import * as readline from "readline";

// Create an interface for reading lines
const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

// Ask the user for input
rl.question('Input kata atau angka: ', (str: string) => {
    if (isPalindrome(str)){
        console.log("palindrome")
    }else{
        console.log("bukan palindrome")
    }
    
  // Close the readline interface
  rl.close();
});