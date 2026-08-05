package unit;

import sys.thread.Lock;

function main() {
    var l = new Lock();
    assert(l.wait(1.0) == false);
    l.release();
    assert(l.wait(0.05) == true);
}
