package go.go.build;

@:structInit
@:go.Type({ name: "MultiplePackageError", instanceName: "build.MultiplePackageError", imports: ["go/build"] })
extern class MultiplePackageError {

    @:native("Dir") var dir: String;
    @:native("Packages") var packages: go.Slice<String>;
    @:native("Files") var files: go.Slice<String>;

    function new(dir: String="", packages: go.Slice<String>=null, files: go.Slice<String>=null);

    @:native("Error") function error(): (String);

}