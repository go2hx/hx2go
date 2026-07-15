package go.internal.trace;

@:go.Type({ name: "version", instanceName: "version.version", imports: ["internal/trace/version"] })
extern class Version {

    @:native("Current") static var Current: go.internal.trace.version.Version;
    @:native("Go111") static var Go111: go.internal.trace.version.Version;
    @:native("Go119") static var Go119: go.internal.trace.version.Version;
    @:native("Go121") static var Go121: go.internal.trace.version.Version;
    @:native("Go122") static var Go122: go.internal.trace.version.Version;
    @:native("Go123") static var Go123: go.internal.trace.version.Version;
    @:native("Go125") static var Go125: go.internal.trace.version.Version;
    @:native("Go126") static var Go126: go.internal.trace.version.Version;

    @:native("ReadHeader") static function readHeader(r: go.io.Reader): go.Result<go.internal.trace.version.Version>;
    @:native("WriteHeader") static function writeHeader(w: go.io.Writer, v: go.internal.trace.version.Version): go.Result<go.GoInt>;

}