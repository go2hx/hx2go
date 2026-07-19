function main() {
    var arr = [1, 2, 3];
    var e = arr[3]; // oob
    trace(e == 0);

    arr[9] = 5;
    trace(arr[9] == 5);
    trace(arr[8] == 0);
    trace(arr.length == 10);
}