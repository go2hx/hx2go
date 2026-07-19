package unit;

function main() {
    var arr = [1, 2, 3];
    var e = arr[3]; // oob
    assert(e == 0);

    arr[9] = 5;
    assert(arr[9] == 5);
    assert(arr[8] == 0);
    assert(arr.length == 10);
}