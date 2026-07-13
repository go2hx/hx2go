package unit;

function main() {
    var messages = new go.Chan<String>(2);
    messages.send("b0");
    messages.send("b1");
    assert(messages.receive() == "b0");
    assert(messages.receive() == "b1");
}