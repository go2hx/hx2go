import go.Chan;
import go.Syntax;

function main() {
    var c = new Chan<Int>(1);
    c.send(1);
    Syntax.select(Select.receive(c, (value) -> {
        trace(value);
    }));
    var l = new sys.thread.Lock();
    trace(l.wait());
    Syntax.go(() -> {
        l.wait(2);
        trace("finish");
        l.release();
    });
    Sys.sleep(1);
    l.release();
    Sys.sleep(0.1);
}