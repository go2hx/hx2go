package go.compress.flate;

/**
    The actual read interface needed by [NewReader].
    If the passed in [io.Reader] does not also have ReadByte,
    the [NewReader] will introduce its own buffering.
**/
@:go.Type({ name: "Reader", instanceName: "flate.Reader", imports: ["compress/flate"] })
extern typedef Reader = {

    @:native("Read") function read(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    @:native("ReadByte") function readByte(): (go.Result<go.Byte>);

}