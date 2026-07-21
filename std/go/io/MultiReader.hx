package go.io;

@:structInit
@:go.Type({ name: "multiReader", instanceName: "io.multiReader", imports: ["io"] })
extern class MultiReader {

    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("WriteTo") function writeTo(w: go.io.Writer): (go.Result<go.Int64>);

}