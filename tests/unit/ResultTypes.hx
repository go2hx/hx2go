package unit;

import go.Slice;
import go.Byte;
import go.Result;
import go.Os;

function main() {
    var v = Os.readFile("./test.txt");
    assert(!v.isOk());
    assert(v.tuple().result == null);

    var matched = switch Os.readFile("./test2392389238239.txt") {
        case Ok(bytes): bytes == null ? "empty" : "ok";
        case Err(_): "err";
    }
    assert(matched == "err");
}
