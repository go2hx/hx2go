package go.internal.abi;

@:go.Type({ name: "IntArgRegBitmap", instanceName: "abi.IntArgRegBitmap", imports: ["internal/abi"] })
extern class IntArgRegBitmap {

    @:native("Get") function get(i: go.GoInt): Bool;
    @:native("Set") function set(i: go.GoInt): Void;

}