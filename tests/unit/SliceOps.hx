package unit;


function main() {
    var arr = [10, 20, 30];
    var sum = 0;

    for (i in 0...arr.length) {
        sum = sum + arr[i];
    }
    
    assert(sum == 60);

    var strs = ["a", "b", "c"];
    var concat = "";

    for (i in 0...strs.length) {
        concat = concat + strs[i];
    }

    assert(concat == "abc");
}
