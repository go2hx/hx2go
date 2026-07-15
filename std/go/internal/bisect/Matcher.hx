package go.internal.bisect;

@:structInit
@:go.Type({ name: "Matcher", instanceName: "bisect.Matcher", imports: ["internal/bisect"] })
extern class Matcher {

    @:native("FileLine") function fileLine(w: go.internal.bisect.Writer, file: String, line: go.GoInt): Bool;
    @:native("MarkerOnly") function markerOnly(): Bool;
    @:native("ShouldEnable") function shouldEnable(id: go.UInt64): Bool;
    @:native("ShouldPrint") function shouldPrint(id: go.UInt64): Bool;
    @:native("Stack") function stack(w: go.internal.bisect.Writer): Bool;

}