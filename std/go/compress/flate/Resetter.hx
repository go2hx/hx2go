package go.compress.flate;

@:go.Type({ name: "Resetter", instanceName: "flate.Resetter", imports: ["compress/flate"] })
extern typedef Resetter = {

    @:native("Reset") function reset(r: go.io.Reader, dict: go.Slice<go.Byte>): go.Error;

}