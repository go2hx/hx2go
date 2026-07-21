package go.go.types;

@:structInit
@:go.Type({ name: "Func", instanceName: "types.Func", imports: ["go/types"] })
extern class Func {

    @:native("Exported") function exported(): (Bool);
    @:native("FullName") function fullName(): (String);
    @:native("Id") function id(): (String);
    @:native("Name") function name(): (String);
    @:native("Origin") function origin(): (go.Pointer<go.go.types.Func>);
    @:native("Parent") function parent(): (go.Pointer<go.go.types.Scope>);
    @:native("Pkg") function pkg(): (go.Pointer<go.go.types.Package>);
    @:native("Pos") function pos(): (go.go.token.Pos);
    @:native("Scope") function scope(): (go.Pointer<go.go.types.Scope>);
    @:native("Signature") function signature(): (go.Pointer<go.go.types.Signature>);
    @:native("String") function string(): (String);
    @:native("Type") function type(): (go.go.types.Type);

}