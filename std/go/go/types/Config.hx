package go.go.types;

/**
    A Config specifies the configuration for type checking.
    The zero value for Config is a ready-to-use default configuration.
**/
@:structInit
@:go.Type({ name: "Config", instanceName: "types.Config", imports: ["go/types"] })
extern class Config {

    @:native("Context") var context: go.Pointer<go.go.types.Context>;
    @:native("GoVersion") var goVersion: std.String;
    @:native("IgnoreFuncBodies") var ignoreFuncBodies: Bool;
    @:native("FakeImportC") var fakeImportC: Bool;
    @:native("Error") var error: (err: go.Error) -> Void;
    @:native("Importer") var importer: go.go.types.Importer;
    @:native("Sizes") var sizes: go.go.types.Sizes;
    @:native("DisableUnusedImportCheck") var disableUnusedImportCheck: Bool;

    function new(context: go.Pointer<go.go.types.Context>=null, goVersion: std.String="", ignoreFuncBodies: Bool=false, fakeImportC: Bool=false, error: (err: go.Error) -> Void=null, importer: go.go.types.Importer=null, sizes: go.go.types.Sizes=null, disableUnusedImportCheck: Bool=false);

    /**
        Check type-checks a package and returns the resulting package object and
        the first error if any. Additionally, if info != nil, Check populates each
        of the non-nil maps in the [Info] struct.
        
        The package is marked as complete if no errors occurred, otherwise it is
        incomplete. See [Config.Error] for controlling behavior in the presence of
        errors.
        
        The package is specified by a list of *ast.Files and corresponding
        file set, and the package path the package is identified with.
        The clean path must not be empty or dot (".").
    **/
    @:native("Check") function check(path: std.String, fset: go.Pointer<go.go.token.FileSet>, files: go.Slice<go.Pointer<go.go.ast.File>>, info: go.Pointer<go.go.types.Info>): (go.Result<go.Pointer<go.go.types.Package>>);

}