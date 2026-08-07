package unit;

import sys.thread.Lock;

function main() {
    // A new Lock is locked, so waiting on it times out.
    var l = new Lock();
    assert(l.wait(0.05) == false);
    l.release();
    assert(l.wait(1.0) == true);
    // That release was consumed by the wait above.
    assert(l.wait(0.05) == false);

    // Releases accumulate: each one lets exactly one wait through.
    var l2 = new Lock();
    l2.release();
    l2.release();
    assert(l2.wait(1.0) == true);
    assert(l2.wait(1.0) == true);
    assert(l2.wait(0.05) == false);

    // release may be called any number of times before anyone waits.
    var l3 = new Lock();
    for (_ in 0...5)
        l3.release();
    var got = 0;
    for (_ in 0...5)
        if (l3.wait(1.0))
            got++;
    assert(got == 5);
    assert(l3.wait(0.05) == false);

    // wait() without a timeout returns once a release is pending.
    var l4 = new Lock();
    var reached = false;
    l4.release();
    l4.wait();
    reached = true;
    assert(reached == true);
}
