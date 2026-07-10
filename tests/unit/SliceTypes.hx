package unit;


function main() {
    var arr = [1, 2, 3];
    var sum = 0;
    
    for (i in 0...arr.length) {
        sum = sum + arr[i];
    }

    assert(sum == 6);
    assert(arr.length == 3);
}
