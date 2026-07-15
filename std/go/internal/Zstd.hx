package go.internal;

@:go.Type({ name: "zstd", instanceName: "zstd.zstd", imports: ["internal/zstd"] })
extern class Zstd {

    @:native("NewReader") static function newReader(input: go.io.Reader): go.Pointer<go.internal.zstd.Reader>;

}