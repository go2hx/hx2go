package unit;

import go.Result;
import go.Os;

function describe(r: Result<String>): String {
    return switch r {
        case Ok(_): "ok";
        case Err(e): e.error();
    }
}

function main() {
    assert(describe(Os.getwd()) == "ok");

    var res = Os.readFile("./missing.txt");
    var matched = switch res {
        case Ok(_): false;
        case Err(e): e != null;
    }
    assert(matched);

    var okOnly = switch Os.getwd() {
        case Ok(_): true;
        case _: false;
    }
    assert(okOnly);

    var errOnly = switch Os.readFile("./missing.txt") {
        case Err(_): true;
        case _: false;
    }
    assert(errOnly);

    var len = switch Os.getwd() {
        case Ok(dir): dir.length;
        case Err(_): -1;
    }
    assert(len > 0);
}
