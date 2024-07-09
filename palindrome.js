function isPalindrome(str){
    for (let i=0;i<str.length/2;i++){
        if (str[i]!=str[str.length-1-i]){
            return false
        }
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
