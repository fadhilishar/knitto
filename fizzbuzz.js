function fizzBuzz(n) {
    for (var i = 0; i < n; i++) {
        switch (true) {
            case i % 15 == 0:
                console.log("FizzBuzz");
                break;
            case i % 5 == 0:
                console.log("Buzz");
                break;
            case i % 3 == 0:
                console.log("Fizz");
                break;
            default:
                console.log(i);
                break;
        }
    }
}
process.stdout.write('Masukkan angka: ');
process.stdin.once('data', function (data) {
    var numStr = data.toString().trim();
    var num = parseInt(numStr);
    fizzBuzz(num);
    process.exit();
});
// fizzBuzz()
