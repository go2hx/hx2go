package unit;


function main() {
    var i: Int = 32;
    var i_dyn: Dynamic = i;
    var sum = i + i_dyn;
    var mut = sum * i_dyn;

    assert(sum == 64);
    assert(mut == 2048);
}
