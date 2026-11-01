package unit;

import go.Slices;
import go.Slice;

function main() {
    var a:Array<Int> = [1, 2, 3];
    var b:Slice<Int> = [0, 1, 2];
    assert(Slices.compare(a, b) == 1);
    assert(Slices.compare([0, 1, 2], [1, 2, 3]) == -1);
    assert(Slices.compare([1, 2], [1, 2]) == 0);
}
