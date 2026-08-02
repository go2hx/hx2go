package go.testing.fstest;

@:structInit
@:go.Type({ name: "fsOnly", instanceName: "fstest.fsOnly", imports: ["testing/fstest"] })
extern class FsOnly {

    @:native("FS") var FS: go.io.fs.FS;

    function new(FS: go.io.fs.FS);

    @:native("Open") function open(name: String): (go.Result<go.io.fs.File>);

}