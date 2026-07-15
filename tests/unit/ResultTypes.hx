package unit;

import go.Slice;
import go.Byte;
import go.Result;
import go.Os;

function main() {
    var v = Os.readFile("./test.txt");
    assert(!v.isOk());
    assert(v.tuple().result == null);
}
