package go.go.types;

@:structInit
@:go.Type({ name: "Config", instanceName: "types.Config", imports: ["go/types"] })
extern class Config {

    @:native("Context") var context: go.Pointer<go.go.types.Context>;
    @:native("GoVersion") var goVersion: String;
    @:native("IgnoreFuncBodies") var ignoreFuncBodies: Bool;
    @:native("FakeImportC") var fakeImportC: Bool;
    @:native("Error") var error: (err: go.Error) -> Void;
    @:native("Importer") var importer: go.go.types.Importer;
    @:native("Sizes") var sizes: go.go.types.Sizes;
    @:native("DisableUnusedImportCheck") var disableUnusedImportCheck: Bool;

    function new(context: go.Pointer<go.go.types.Context>, goVersion: String, ignoreFuncBodies: Bool, fakeImportC: Bool, error: (err: go.Error) -> Void, importer: go.go.types.Importer, sizes: go.go.types.Sizes, disableUnusedImportCheck: Bool);

    @:native("Check") function check(path: String, fset: go.Pointer<go.go.token.FileSet>, files: go.Slice<go.Pointer<go.go.ast.File>>, info: go.Pointer<go.go.types.Info>): (go.Result<go.Pointer<go.go.types.Package>>);

}