package go.os;

@:structInit
@:go.Type({ name: "noReadFrom", instanceName: "os.noReadFrom", imports: ["os"] })
extern class NoReadFrom {

    @:native("ReadFrom") function readFrom(p0: go.io.Reader): (go.Result<go.Int64>);

}