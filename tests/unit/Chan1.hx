package unit;

import go.Chan;

function main() {
    var messages = new Chan<String>(2);
    messages.send("b0");
    messages.send("b1");
    assert(messages.receive() == "b0");
    assert(messages.receive() == "b1");
}