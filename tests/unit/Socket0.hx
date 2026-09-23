package unit;

import sys.net.Socket;
import sys.net.Host;

function main() {
    // bind & listen
    var s = new Socket();
    var host = new Host("127.0.0.1");
    s.bind(host, 0);
    s.listen(1);
    var port = s.host().port;
    assert(port > 0);

    // connect
    var c = new Socket();
    c.connect(host, port);
    assert(c.input != null);
    assert(c.output != null);

    // select when accept() would succeed
    var select = Socket.select([s], [s], [s], 0.01);
    assert(select.read.length == 1);
    assert(select.write.length == 0);
    assert(select.others.length == 0);

    // multiple selects without reading
    var select = Socket.select([s], [s], [s], 0.01);
    assert(select.read.length == 1);
    assert(select.write.length == 0);
    assert(select.others.length == 0);

    // accept
    var w = s.accept();
    assert(w != null);
    assert(w.input != null);
    assert(w.output != null);
    w.setFastSend(true);
    s.setBlocking(false);

    // select after accept
    var select = Socket.select([s], [s], [s], 0.01);
    assert(select.read.length == 0);
    assert(select.write.length == 0);
    assert(select.others.length == 0);

    // write
    w.output.writeByte(97);
    w.output.writeByte(98);
    w.output.writeByte(99);
    w.close();

    // read
    c.waitForRead();
    var select = Socket.select([c], [c], [c]);
    assert(select.read.length == 1);
    assert(select.write.length == 1);
    assert(select.others.length == 0);
    assert(c.read() == "abc");

    c.close();
    s.close();
}
