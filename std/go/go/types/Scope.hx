package go.go.types;

@:structInit
@:go.Type({ name: "Scope", instanceName: "types.Scope", imports: ["go/types"] })
extern class Scope {

    @:native("Child") function child(i: go.GoInt): (go.Pointer<go.go.types.Scope>);
    @:native("Children") function children(): (go.iter.Seq<go.Pointer<go.go.types.Scope>>);
    @:native("Contains") function contains(pos: go.go.token.Pos): (Bool);
    @:native("End") function end(): (go.go.token.Pos);
    @:native("Innermost") function innermost(pos: go.go.token.Pos): (go.Pointer<go.go.types.Scope>);
    @:native("Insert") function insert(obj: go.go.types.Object): (go.go.types.Object);
    @:native("Len") function len(): (go.GoInt);
    @:native("Lookup") function lookup(name: String): (go.go.types.Object);
    @:go.Tuple("p0", "p1") @:native("LookupParent") function lookupParent(name: String, pos: go.go.token.Pos): (go.Tuple<{ p0: go.Pointer<go.go.types.Scope>, p1: go.go.types.Object }>);
    @:native("Names") function names(): (go.Slice<String>);
    @:native("NumChildren") function numChildren(): (go.GoInt);
    @:native("Parent") function parent(): (go.Pointer<go.go.types.Scope>);
    @:native("Pos") function pos(): (go.go.token.Pos);
    @:native("String") function string(): (String);
    @:native("WriteTo") function writeTo(w: go.io.Writer, n: go.GoInt, recurse: Bool): Void;

}