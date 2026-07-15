package go.go.types;

@:structInit
@:go.Type({ name: "MethodSet", instanceName: "types.MethodSet", imports: ["go/types"] })
extern class MethodSet {

    @:native("At") function at(i: go.GoInt): go.Pointer<go.go.types.Selection>;
    @:native("Len") function len(): go.GoInt;
    @:native("Lookup") function lookup(pkg: go.Pointer<go.go.types.Package>, name: String): go.Pointer<go.go.types.Selection>;
    @:native("Methods") function methods(): go.iter.Seq<go.Pointer<go.go.types.Selection>>;
    @:native("String") function string(): String;

}