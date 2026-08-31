package go.go.types;

/**
    An Object is a named language entity.
    An Object may be a constant ([Const]), type name ([TypeName]),
    variable or struct field ([Var]), function or method ([Func]),
    imported package ([PkgName]), label ([Label]),
    built-in function ([Builtin]),
    or the predeclared identifier 'nil' ([Nil]).
    
    The environment, which is structured as a tree of Scopes,
    maps each name to the unique Object that it denotes.
**/
@:go.Type({ name: "Object", instanceName: "types.Object", imports: ["go/types"] })
extern typedef Object = {

    @:native("Exported") function exported(): (Bool);
    @:native("Id") function id(): (std.String);
    @:native("Name") function name(): (std.String);
    @:native("Parent") function parent(): (go.Pointer<go.go.types.Scope>);
    @:native("Pkg") function pkg(): (go.Pointer<go.go.types.Package>);
    @:native("Pos") function pos(): (go.go.token.Pos);
    @:native("String") function string(): (std.String);
    @:native("Type") function type(): (go.go.types.Type);

}