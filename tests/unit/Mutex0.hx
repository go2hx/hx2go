package unit;

import sys.thread.Mutex;
import go.Syntax;

function main() {
    var m = new Mutex();
    Syntax.go(() -> {
        m.acquire();
        m.release();
    });
}