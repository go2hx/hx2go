package go.time;

@:structInit
@:go.Type({ name: "parseDurationError", instanceName: "time.parseDurationError", imports: ["time"] })
extern class ParseDurationError {

    @:native("Error") function error(): (String);

}