package go.internal;

@:go.Type({ name: "goroot", instanceName: "goroot.goroot", imports: ["internal/goroot"] })
extern class Goroot {

    @:native("IsStandardPackage") static function isStandardPackage(readDir: (p0: String) -> go.Result<go.Slice<go.os.DirEntry>>, goroot: String, compiler: String, path: String): Bool;

}