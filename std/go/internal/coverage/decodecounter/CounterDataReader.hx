package go.internal.coverage.decodecounter;

@:structInit
@:go.Type({ name: "CounterDataReader", instanceName: "decodecounter.CounterDataReader", imports: ["internal/coverage/decodecounter"] })
extern class CounterDataReader {

    @:native("BeginNextSegment") function beginNextSegment(): go.Result<Bool>;
    @:native("Goarch") function goarch(): String;
    @:native("Goos") function goos(): String;
    @:native("NextFunc") function nextFunc(p: go.Pointer<go.internal.coverage.decodecounter.FuncPayload>): go.Result<Bool>;
    @:native("NumFunctionsInSegment") function numFunctionsInSegment(): go.UInt32;
    @:native("NumSegments") function numSegments(): go.UInt32;
    @:native("OsArgs") function osArgs(): go.Slice<String>;

}