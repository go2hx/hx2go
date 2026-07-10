package unit;


import haxe.iterators.ArrayIterator;

function main() {
    var arr = [10, 20, 30];
    var iter = new ArrayIterator(arr);

    assert(iter.hasNext() == true);
    assert(iter.next() == 10);
    assert(iter.hasNext() == true);
    assert(iter.next() == 20);
    assert(iter.hasNext() == true);
    assert(iter.next() == 30);
    assert(iter.hasNext() == false);
}
