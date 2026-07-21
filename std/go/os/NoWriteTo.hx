package go.os;

@:structInit
@:go.Type({ name: "noWriteTo", instanceName: "os.noWriteTo", imports: ["os"] })
extern class NoWriteTo {

    @:native("WriteTo") function writeTo(p0: go.io.Writer): (go.Result<go.Int64>);

}