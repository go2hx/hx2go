package go.go.build;

/**
    MultiplePackageError describes a directory containing
    multiple buildable Go source files for multiple packages.
**/
@:structInit
@:go.Type({ name: "MultiplePackageError", instanceName: "build.MultiplePackageError", imports: ["go/build"] })
extern class MultiplePackageError {

    @:native("Dir") var dir: String;
    @:native("Packages") var packages: go.Slice<String>;
    @:native("Files") var files: go.Slice<String>;

    function new(dir: String="", packages: go.Slice<String>=null, files: go.Slice<String>=null);

    @:native("Error") function error(): (String);

}