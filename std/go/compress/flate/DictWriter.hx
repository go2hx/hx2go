package go.compress.flate;

@:structInit
@:go.Type({ name: "dictWriter", instanceName: "flate.dictWriter", imports: ["compress/flate"] })
extern class DictWriter {

    @:native("Write") function write(b: go.Slice<go.Byte>): (go.Result<go.GoInt>);

}