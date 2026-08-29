package go.compress.flate;

/**
    Resetter resets a ReadCloser returned by [NewReader] or [NewReaderDict]
    to switch to a new underlying [Reader]. This permits reusing a ReadCloser
    instead of allocating a new one.
**/
@:go.Type({ name: "Resetter", instanceName: "flate.Resetter", imports: ["compress/flate"] })
extern typedef Resetter = {

    @:native("Reset") function reset(r: go.io.Reader, dict: go.Slice<go.Byte>): (go.Error);

}