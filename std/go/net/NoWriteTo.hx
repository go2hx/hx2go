package go.net;

@:structInit
@:go.Type({ name: "noWriteTo", instanceName: "net.noWriteTo", imports: ["net"] })
extern class NoWriteTo {

    @:native("WriteTo") function writeTo(p0: go.io.Writer): (go.Result<go.Int64>);

}