package sys.net;

class Socket {

    public var input(default, null): haxe.io.Input;
    public var output(default, null): haxe.io.Output;
    public var custom: Dynamic;

    public function new(): Void {
        return; // TODO: impl
    }

    public function close(): Void {
        return; // TODO: impl
    }

    public function read(): String {
        return ""; // TODO: impl
    }

    public function write(content: String): Void {
        return; // TODO: impl
    }

    public function connect(host: Host, port: Int): Void {
        return; // TODO: impl
    }

    public function listen(connections: Int): Void {
        return; // TODO: impl
    }

    public function shutdown(read: Bool, write: Bool): Void {
        return; // TODO: impl
    }

    public function bind(host: Host, port: Int): Void {
        return; // TODO: impl
    }

    public function accept(): Socket {
        return new Socket(); // TODO: impl
    }

    public function peer(): { host: Host, port: Int } {
        return {
            host: new Host("0.0.0.0"),
            port: 80
        }; // TODO: impl
    }

    public function host(): { host: Host, port: Int } {
        return {
            host: new Host("0.0.0.0"),
            port: 80
        }; // TODO: impl
    }

    public function setTimeout(timeout: Float): Void {
        return; // TODO: impl
    }

    public function waitForRead(): Void {
        return; // TODO: impl
    }

    public function setBlocking(b: Bool): Void {
        return; // TODO: impl
    }

    public function setFastSend(b: Bool): Void {
        return; // TODO: impl
    }

    public static function select(read: Array<Socket>, write: Array<Socket>, others: Array<Socket>, ?timeout: Float): { read: Array<Socket>, write: Array<Socket>, others: Array<Socket> } {
        return {
            read: [],
            write: [],
            others: []
        }; // TODO: impl
    }

}