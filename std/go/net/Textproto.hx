package go.net;

@:go.Type({ name: "textproto", instanceName: "textproto.textproto", imports: ["net/textproto"] })
extern class Textproto {

    @:native("CanonicalMIMEHeaderKey") static function canonicalMIMEHeaderKey(s: String): String;
    @:native("Dial") static function dial(network: String, addr: String): go.Result<go.Pointer<go.net.textproto.Conn>>;
    @:native("NewConn") static function newConn(conn: go.io.ReadWriteCloser): go.Pointer<go.net.textproto.Conn>;
    @:native("NewReader") static function newReader(r: go.Pointer<go.bufio.Reader>): go.Pointer<go.net.textproto.Reader>;
    @:native("NewWriter") static function newWriter(w: go.Pointer<go.bufio.Writer>): go.Pointer<go.net.textproto.Writer>;
    @:native("TrimBytes") static function trimBytes(b: go.Slice<go.Byte>): go.Slice<go.Byte>;
    @:native("TrimString") static function trimString(s: String): String;

}