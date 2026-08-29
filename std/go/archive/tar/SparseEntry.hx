package go.archive.tar;

@:structInit
@:go.Type({ name: "sparseEntry", instanceName: "tar.sparseEntry", imports: ["archive/tar"] })
extern class SparseEntry {

    @:native("Offset") var offset: go.Int64;
    @:native("Length") var length: go.Int64;

    function new(offset: go.Int64=0, length: go.Int64=0);

}