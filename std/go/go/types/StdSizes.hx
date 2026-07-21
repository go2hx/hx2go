package go.go.types;

@:structInit
@:go.Type({ name: "StdSizes", instanceName: "types.StdSizes", imports: ["go/types"] })
extern class StdSizes {

    @:native("WordSize") var wordSize: go.Int64;
    @:native("MaxAlign") var maxAlign: go.Int64;

    function new(wordSize: go.Int64, maxAlign: go.Int64);

    @:native("Alignof") function alignof(T: go.go.types.Type): (go.Int64);
    @:native("Offsetsof") function offsetsof(fields: go.Slice<go.Pointer<go.go.types.Var>>): (go.Slice<go.Int64>);
    @:native("Sizeof") function sizeof(T: go.go.types.Type): (go.Int64);

}