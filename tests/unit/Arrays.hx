package unit;

function main() {
    var arr = [1, 2, 3];
    assert(arr[0] == 1);
    assert(arr[1] == 2);
    assert(arr[2] == 3);
    assert(arr.length == 3);

    var arr2: Array<String> = ["hello", "world"];
    assert(arr2[0] == "hello");
    assert(arr2.length == 2);

    var arr3: Array<Float> = [1.1, 2.2, 3.3];
    assert(arr3[0] == 1.1);
    assert(arr3.length == 3);
}
