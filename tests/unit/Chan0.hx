package unit;

import go.Syntax;
import go.Go;

function main() {
    var messages = new go.Chan<String>();
    Syntax.go(() -> {
        messages.send("hi");
        assert(messages.receive() == "hey");
    });
    assert(messages.receive() == "hi");
    messages.send("hey");
}