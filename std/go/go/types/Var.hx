package go.go.types;

@:structInit
@:go.Type({ name: "Var", instanceName: "types.Var", imports: ["go/types"] })
extern class Var {

    @:native("Anonymous") function anonymous(): (Bool);
    @:native("Embedded") function embedded(): (Bool);
    @:native("Exported") function exported(): (Bool);
    @:native("Id") function id(): (String);
    @:native("IsField") function isField(): (Bool);
    @:native("Kind") function kind(): (go.go.types.VarKind);
    @:native("Name") function name(): (String);
    @:native("Origin") function origin(): (go.Pointer<go.go.types.Var>);
    @:native("Parent") function parent(): (go.Pointer<go.go.types.Scope>);
    @:native("Pkg") function pkg(): (go.Pointer<go.go.types.Package>);
    @:native("Pos") function pos(): (go.go.token.Pos);
    @:native("SetKind") function setKind(kind: go.go.types.VarKind): Void;
    @:native("String") function string(): (String);
    @:native("Type") function type(): (go.go.types.Type);

}