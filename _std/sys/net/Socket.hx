package sys.net;

import sys.net.Host;
import go.net.TCPConn;
import go.net.TCPListener;
import go.bufio.Reader;
import go.Pointer;
import go.Bufio;
import go.Net;
import go.Time;
import go.Go;
import go.Syntax;

class Socket {

    public var input(default, null): haxe.io.Input;
    public var output(default, null): haxe.io.Output;
    public var custom: Dynamic;

    static inline var PROBE_MS = 2;

    var timeout:Float = 0;
    var conn:Pointer<TCPConn>;
    var reader:Pointer<Reader>;
    var ln:Pointer<TCPListener>;
    var serverMode = false;
    var blocking = true;
    var pending:Pointer<TCPConn>;
    var _host:Host;
    var _port:Int = 0;

    public function new(): Void {}

    private function setupStreams(): Void {
        reader = Bufio.newReader(conn);
        input = new SocketInput(reader);
        output = new SocketOutput(conn);
    }

    private function addr(): String {
        var h = _host == null ? "" : _host.host;
        return h + ":" + _port;
    }

    static inline function zeroTime(): go.time.Time {
        return Syntax.code("time.Time{}");
    }

    public function close(): Void {
        if (conn != null) conn.close();
        if (ln != null) ln.close();
    }

    public function read(): String {
        return input.readAll().toString();
    }

    public function write(content: String): Void {
        output.writeString(content);
    }

    public function connect(host: Host, port: Int): Void {
        _host = host;
        _port = port;
        var raddr = Net.resolveTCPAddr("tcp", addr()).sure();
        conn = Net.dialTCP("tcp", null, raddr).sure();
        setupStreams();
    }

    public function listen(connections: Int): Void {
        serverMode = true;
        var laddr = Net.resolveTCPAddr("tcp", addr()).sure();
        ln = Net.listenTCP("tcp", laddr).sure();
        var s = ln.addr().string();
        var index = s.lastIndexOf(":") + 1;
        _port = Std.parseInt(s.substr(index));
    }

    public function shutdown(read: Bool, write: Bool): Void {
        if (conn == null) return;
        if (read) conn.closeRead();
        if (write) conn.closeWrite();
    }

    public function bind(host: Host, port: Int): Void {
        _host = host;
        _port = port;
    }

    private function wrapConn(c: Pointer<TCPConn>): Socket {
        var w = new Socket();
        w.conn = c;
        w.setupStreams();
        return w;
    }

    public function accept(): Socket {
        if (pending != null) {
            var c = pending;
            pending = null;
            return wrapConn(c);
        }
        var c = ln.acceptTCP().sure();
        return wrapConn(c);
    }

    public function peer(): { host: Host, port: Int } {
        var s = conn.remoteAddr().string();
        var index = s.lastIndexOf(":");
        return {
            host: new Host(s.substr(0, index)),
            port: Std.parseInt(s.substr(index + 1))
        };
    }

    public function host(): { host: Host, port: Int } {
        return {host: _host, port: _port};
    }

    public function setTimeout(timeout: Float): Void {
        this.timeout = timeout;
    }

    public function waitForRead(): Void {
        Socket.select([this], null, null);
    }

    public function setBlocking(b: Bool): Void {
        blocking = b;
    }

    public function setFastSend(b: Bool): Void {
        if (conn != null) conn.setNoDelay(b);
    }

    private function readReady(): Bool {
        if (serverMode) {
            if (pending != null) return true;
            ln.setDeadline(Time.now().add(Go.int64(Time.millisecond) * PROBE_MS));
            var t = ln.acceptTCP();
            ln.setDeadline(zeroTime());
            if (!t.isOk())
                return false;
            pending = t.sure();
            return true;
        } else {
            if (reader.buffered() > 0) return true;
            conn.setReadDeadline(Time.now().add(Go.int64(Time.millisecond) * PROBE_MS));
            var res = reader.peek(1).sure();
            conn.setReadDeadline(zeroTime());
            return res.length > 0;
        }
    }

    private function writeReady(): Bool {
        return !serverMode && conn != null;
    }

    public static function select(read: Array<Socket>, write: Array<Socket>, others: Array<Socket>, ?timeout: Float): { read: Array<Socket>, write: Array<Socket>, others: Array<Socket> } {
        if (read == null) read = [];
        if (write == null) write = [];
        if (others == null) others = [];

        var hasDeadline = timeout != null;
        var deadline = hasDeadline ? Time.now().add(Go.int64(timeout * 1000000000)) : zeroTime();

        while (true) {
            var outRead = [for (s in read) if (s.readReady()) s];
            var outWrite = [for (s in write) if (s.writeReady()) s];
            // other is never added to
            var outOthers:Array<Socket> = [];

            if (outRead.length > 0 || outWrite.length > 0)
                return { read: outRead, write: outWrite, others: outOthers };

            if (hasDeadline && Time.now().after(deadline))
                return { read: outRead, write: outWrite, others: outOthers };

            if (read.length == 0 && write.length == 0)
                Time.sleep(Go.int64(Time.millisecond) * PROBE_MS);
        }
    }

}
