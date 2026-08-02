package go.os;

@:go.Type({ name: "Signal", instanceName: "os.Signal", imports: ["os"] })
extern typedef Signal = {

    @:native("Signal") function signal(): Void;
    @:native("String") function string(): (String);

}