package go.go.types;

@:structInit
@:go.Type({ name: "Const", instanceName: "types.Const", imports: ["go/types"] })
extern class Const {

    @:native("Exported") function exported(): Bool;
    @:native("Id") function id(): String;
    @:native("Name") function name(): String;
    @:native("Parent") function parent(): go.Pointer<go.go.types.Scope>;
    @:native("Pkg") function pkg(): go.Pointer<go.go.types.Package>;
    @:native("Pos") function pos(): go.go.token.Pos;
    @:native("String") function string(): String;
    @:native("Type") function type(): go.go.types.Type;
    @:native("Val") function val(): go.go.constant.Value;

}