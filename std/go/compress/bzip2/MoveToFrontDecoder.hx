package go.compress.bzip2;

@:go.Type({ name: "moveToFrontDecoder", instanceName: "bzip2.moveToFrontDecoder", imports: ["compress/bzip2"] })
extern class MoveToFrontDecoder {

    @:native("Decode") function decode(n: go.GoInt): (go.Byte);
    @:native("First") function first(): (go.Byte);

}