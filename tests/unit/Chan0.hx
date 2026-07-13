package unit;

import go.Syntax;
import go.Go;

function main() {
    var messages = new go.Chan<String>();
    var done = new go.Chan<Bool>();
    Syntax.go(() -> {
        messages.send("hi");
        assert(messages.receive() == "hey");
        done.send(true);
    });
    assert(messages.receive() == "hi");
    messages.send("hey");
    done.receive();
}