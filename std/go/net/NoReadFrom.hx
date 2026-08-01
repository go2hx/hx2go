package go.net;

@:structInit
@:go.Type({ name: "noReadFrom", instanceName: "net.noReadFrom", imports: ["net"] })
extern class NoReadFrom {

    @:native("ReadFrom") function readFrom(p0: go.io.Reader): (go.Result<go.Int64>);

}