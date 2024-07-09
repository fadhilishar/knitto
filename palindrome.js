function isPalindrome(str){
    // const str = num.toString()
    let left=0
    let right=str.length-1
    for (;left<right;){
        if (str[left]!=str[right]){
            return false
        }
        left++
        right--
    }
    return true
}

const readline = require('readline');

const rl = readline.createInterface({
  input: process.stdin,
  output: process.stdout
});

rl.question('Masukkan kata atau angka ', (answer) => {
    if (isPalindrome(answer)){
        console.log("palindrome")
    }else{
        console.log("bukan palindrome")
    }

  rl.close();
});
