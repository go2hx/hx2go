package go.crypto.tls;

@:structInit
@:go.Type({ name: "finishedHash", instanceName: "tls.finishedHash", imports: ["crypto/tls"] })
extern class FinishedHash {

    @:native("Sum") function sum(): (go.Slice<go.Byte>);
    @:native("Write") function write(msg: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}