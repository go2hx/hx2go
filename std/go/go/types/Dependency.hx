package go.go.types;

@:go.Type({ name: "dependency", instanceName: "types.dependency", imports: ["go/types"] })
extern typedef Dependency = {

    @:native("Exported") function exported(): (Bool);
    @:native("Id") function id(): (String);
    @:native("Name") function name(): (String);
    @:native("Parent") function parent(): (go.Pointer<go.go.types.Scope>);
    @:native("Pkg") function pkg(): (go.Pointer<go.go.types.Package>);
    @:native("Pos") function pos(): (go.go.token.Pos);
    @:native("String") function string(): (String);
    @:native("Type") function type(): (go.go.types.Type);

}