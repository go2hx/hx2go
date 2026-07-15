package go.crypto.tls;

@:structInit
@:go.Type({ name: "RecordHeaderError", instanceName: "tls.RecordHeaderError", imports: ["crypto/tls"] })
extern class RecordHeaderError {

    @:native("Msg") var msg: String;
    @:native("RecordHeader") var recordHeader: go.GoArray<go.Byte, 5>;
    @:native("Conn") var conn: go.net.Conn;

function new(msg: String, recordHeader: go.GoArray<go.Byte, 5>, conn: go.net.Conn);

    @:native("Error") function error(): String;

}