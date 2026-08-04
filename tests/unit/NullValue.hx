package unit;
var ni:Null<Int> = null; // a field to prevent local optimizations

function main() {
    assert(!(ni == 0));
    assert(!(0 == ni));
    assert(ni == ni);
}