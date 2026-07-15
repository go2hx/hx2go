package go.crypto.tls;

@:structInit
@:go.Type({ name: "SessionState", instanceName: "tls.SessionState", imports: ["crypto/tls"] })
extern class SessionState {

    @:native("Extra") var extra: go.Slice<go.Slice<go.Byte>>;
    @:native("EarlyData") var earlyData: Bool;

function new(extra: go.Slice<go.Slice<go.Byte>>, earlyData: Bool);

    @:native("Bytes") function bytes(): go.Result<go.Slice<go.Byte>>;

}