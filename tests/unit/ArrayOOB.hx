package unit;

function main() {
    var arr = [1, 2, 3];
    var e = arr[3]; // oob
    #if target.static
    assert(e == 0);
    #end

    arr[9] = 5;
    assert(arr[9] == 5);
    #if target.static
        assert(arr[8] == 0);
    #end
    assert(arr.length == 10);
}