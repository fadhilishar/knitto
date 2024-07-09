function isPalindrome(str: string): boolean {
    let left=0
    let right=str.length-1
    for (;left<right;){
        if (str.charAt(left)!=str.charAt(right)){
            return false
        }
        left++
        right--
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