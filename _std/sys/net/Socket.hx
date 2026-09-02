package sys.net;

import sys.net.Host;
import go.net.TCPConn;
import go.net.TCPListener;
import go.net.TCPAddr;
import go.syscall.FdSet;
import go.Pointer;
import go.Net;
import go.Go;
import go.Syntax;
import go.Syscall;

class Socket {

    public var input(default, null): haxe.io.Input;
    public var output(default, null): haxe.io.Output;
    public var custom: Dynamic;

    var timeout:Float = 0;
    var conn:Pointer<TCPConn>;
    var ln:Pointer<TCPListener>;
    var serverMode = false;
    var blocking = true;
    var fd:Int = -1;
    var _host:Host;
    var _port:Int = 0;

    public function new(): Void {}

    private function setupStreams(): Void {
        input = new SocketInput(conn);
        output = new SocketOutput(conn);
    }

    private function addr(): String {
        var h = _host == null ? "" : _host.host;
        return h + ":" + _port;
    }

    private static function controlFd(raw: go.syscall.RawConn): Int {
        var out = -1;
        raw.control(f -> out = (f : Int));
        return out;
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
        fd = controlFd(conn.syscallConn().sure());
        setupStreams();
    }

    public function listen(connections: Int): Void {
        serverMode = true;
        var laddr = Net.resolveTCPAddr("tcp", addr()).sure();
        ln = Net.listenTCP("tcp", laddr).sure();
        fd = controlFd(ln.syscallConn().sure());
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

    public function accept(): Socket {
        var c = ln.acceptTCP().sure();
        var w = new Socket();
        w.conn = c;
        w.fd = controlFd(c.syscallConn().sure());
        w.setupStreams();
        return w;
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

    private static inline function fdZero(): FdSet {
        // TODO: non Syntax.code would require a GoArray default value creation
        return Syntax.code("syscall.FdSet{}");
    }

    private static inline function fdSet(fd: Int, set: Pointer<FdSet>): Void {
        Syntax.code("{0}.Bits[{1}/32] |= int32(1) << (uint({1}) % 32)", set, fd);
    }

    private static inline function fdIsSet(fd: Int, set: Pointer<FdSet>): Bool {
        return Syntax.code("({0}.Bits[{1}/32] & (int32(1) << (uint({1}) % 32))) != 0", set, fd);
    }

    public static function select(read: Array<Socket>, write: Array<Socket>, others: Array<Socket>, ?timeout: Float): { read: Array<Socket>, write: Array<Socket>, others: Array<Socket> } {
        if (read == null) read = [];
        if (write == null) write = [];
        if (others == null) others = [];

        var rset = fdZero();
        var wset = fdZero();
        var eset = fdZero();
        var maxfd = -1;

        for (s in read) if (s.fd >= 0) { fdSet(s.fd, Pointer.addressOf(rset)); if (s.fd > maxfd) maxfd = s.fd; }
        for (s in write) if (s.fd >= 0) { fdSet(s.fd, Pointer.addressOf(wset)); if (s.fd > maxfd) maxfd = s.fd; }
        for (s in others) if (s.fd >= 0) { fdSet(s.fd, Pointer.addressOf(eset)); if (s.fd > maxfd) maxfd = s.fd; }

        var nfds = maxfd + 1;
        var rp = Pointer.addressOf(rset);
        var wp = Pointer.addressOf(wset);
        var ep = Pointer.addressOf(eset);

        var err:go.Error;
        if (timeout == null) {
            err = Syscall.select(nfds, rp, wp, ep, null);
        } else {
            var sec = Std.int(timeout);
            var usec = Std.int((timeout - sec) * 1000000);
            // TODO: non Syntax.code would require a GoArray default value creation
            var tv:go.syscall.Timeval = Syntax.code("syscall.Timeval{Sec: {0}, Usec: {1}}", Go.int64(sec), Go.int32(usec));
            err = Syscall.select(nfds, rp, wp, ep, Pointer.addressOf(tv));
        }
        if (err != null && err.error() != "interrupted system call") {
            throw haxe.io.Error.Custom(err);
        }

        var outRead = [];
        var outWrite = [];
        var outOthers = [];
        for (s in read) if (s.fd >= 0 && fdIsSet(s.fd, rp)) outRead.push(s);
        for (s in write) if (s.fd >= 0 && fdIsSet(s.fd, wp)) outWrite.push(s);
        for (s in others) if (s.fd >= 0 && fdIsSet(s.fd, ep)) outOthers.push(s);

        return { read: outRead, write: outWrite, others: outOthers };
    }

}
