package go.compress.zlib;

@:go.Type({ name: "Resetter", instanceName: "zlib.Resetter", imports: ["compress/zlib"] })
extern typedef Resetter = {

    @:native("Reset") function reset(r: go.io.Reader, dict: go.Slice<go.Byte>): go.Error;

}