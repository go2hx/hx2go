package go.debug;

@:go.Type({ name: "buildinfo", instanceName: "buildinfo.buildinfo", imports: ["debug/buildinfo"] })
extern class Buildinfo {

    @:native("Read") static function read(r: go.io.ReaderAt): go.Result<go.Pointer<go.debug.buildinfo.BuildInfo>>;
    @:native("ReadFile") static function readFile(name: String): go.Result<go.Pointer<go.debug.buildinfo.BuildInfo>>;

}