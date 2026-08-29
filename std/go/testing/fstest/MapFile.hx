package go.testing.fstest;

/**
    A MapFile describes a single file in a [MapFS].
**/
@:structInit
@:go.Type({ name: "MapFile", instanceName: "fstest.MapFile", imports: ["testing/fstest"] })
extern class MapFile {

    @:native("Data") var data: go.Slice<go.Byte>;
    @:native("Mode") var mode: go.io.fs.FileMode;
    @:native("ModTime") var modTime: go.time.Time;
    @:native("Sys") var sys: Dynamic;

    function new(data: go.Slice<go.Byte>=null, mode: go.io.fs.FileMode=cast 0, modTime: go.time.Time, sys: Dynamic=null);

}