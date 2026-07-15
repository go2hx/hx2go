package go.internal.platform;

@:structInit
@:go.Type({ name: "OSArch", instanceName: "platform.OSArch", imports: ["internal/platform"] })
extern class OSArch {

    @:native("GOOS") var GOOS: String;
    @:native("GOARCH") var GOARCH: String;

function new(GOOS: String, GOARCH: String);

    @:native("String") function string(): String;

}