package go.encoding.xml;

@:structInit
@:go.Type({ name: "printer", instanceName: "xml.printer", imports: ["encoding/xml"] })
extern class Printer {

    @:native("Close") function close(): (go.Error);
    @:native("EscapeString") function escapeString(s: String): Void;
    @:native("Write") function write(b: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("WriteByte") function writeByte(c: go.Byte): (go.Error);
    @:native("WriteString") function writeString(s: String): (go.Result<go.GoInt>);

}