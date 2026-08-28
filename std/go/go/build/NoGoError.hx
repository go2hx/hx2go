package go.go.build;

/**
    NoGoError is the error used by [Import] to describe a directory
    containing no buildable Go source files. (It may still contain
    test files, files hidden by build tags, and so on.)
**/
@:structInit
@:go.Type({ name: "NoGoError", instanceName: "build.NoGoError", imports: ["go/build"] })
extern class NoGoError {

    @:native("Dir") var dir: String;

    function new(dir: String="");

    @:native("Error") function error(): (String);

}