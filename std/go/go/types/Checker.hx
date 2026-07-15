package go.go.types;

@:structInit
@:go.Type({ name: "Checker", instanceName: "types.Checker", imports: ["go/types"] })
extern class Checker {

    @:native("Info") var info: go.Pointer<go.go.types.Info>;

function new(info: go.Pointer<go.go.types.Info>);

    @:native("Files") function files(files: go.Slice<go.Pointer<go.go.ast.File>>): go.Error;
    @:native("ObjectOf") function objectOf(id: go.Pointer<go.go.ast.Ident>): go.go.types.Object;
    @:native("PkgNameOf") function pkgNameOf(imp: go.Pointer<go.go.ast.ImportSpec>): go.Pointer<go.go.types.PkgName>;
    @:native("TypeOf") function typeOf(e: go.go.ast.Expr): go.go.types.Type;

}