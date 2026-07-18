package unit;

import go.Syntax;
import go.Chan;

function main() {
    // TODO enable when select is implemented properly
    // // A ready receive case runs, and its value is bound into the callback arg.
    // var ch = new Chan<Int>(1);
    // ch.send(42);
    // var got = -1;
    // Syntax.select(
    //     Select.receive(ch, (v: Int) -> { got = v; }),
    //     Select.defaultCase(() -> { got = 0; })
    // );
    // assert(got == 42);

    // // No case ready -> the default runs.
    // var ch2 = new Chan<Int>(1);
    // var hit = -1;
    // Syntax.select(
    //     Select.receive(ch2, (v: Int) -> { hit = v; }),
    //     Select.defaultCase(() -> { hit = 99; })
    // );
    // assert(hit == 99);

    // // A ready send case runs (buffer has room), then the value is observable.
    // var ch3 = new Chan<Int>(1);
    // var sent = false;
    // Syntax.select(
    //     Select.send(ch3, 7, () -> { sent = true; }),
    //     Select.defaultCase(() -> { sent = false; })
    // );
    // assert(sent == true);
    // assert(ch3.receive() == 7);

    // // A receive callback that ignores the value still runs the body.
    // var ch4 = new Chan<Int>(1);
    // ch4.send(5);
    // var ran = false;
    // Syntax.select(
    //     Select.receive(ch4, (_) -> { ran = true; })
    // );
    // assert(ran == true);
}
