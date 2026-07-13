package unit;

function get(x:Dynamic, index:Int) {
    return x[index];
}

function getStr(x:Dynamic, index:Int) {
    return x[index];
}

function main() {
    var nums:Dynamic = [10, 11];
    assert(get(nums, 0) == 10);
    assert(get(nums, 1) == 11);

    var words:Dynamic = ["a", "b"];
    assert(getStr(words, 0) == "a");
    assert(getStr(words, 1) == "b");
}
