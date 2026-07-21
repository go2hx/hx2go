package go.go.types;

@:structInit
@:go.Type({ name: "Package", instanceName: "types.Package", imports: ["go/types"] })
extern class Package {

    @:native("Complete") function complete(): (Bool);
    @:native("GoVersion") function goVersion(): (String);
    @:native("Imports") function imports(): (go.Slice<go.Pointer<go.go.types.Package>>);
    @:native("MarkComplete") function markComplete(): Void;
    @:native("Name") function name(): (String);
    @:native("Path") function path(): (String);
    @:native("Scope") function scope(): (go.Pointer<go.go.types.Scope>);
    @:native("SetImports") function setImports(list: go.Slice<go.Pointer<go.go.types.Package>>): Void;
    @:native("SetName") function setName(name: String): Void;
    @:native("String") function string(): (String);

}