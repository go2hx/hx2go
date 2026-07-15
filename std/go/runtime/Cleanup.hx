package go.runtime;

@:structInit
@:go.Type({ name: "Cleanup", instanceName: "runtime.Cleanup", imports: ["runtime"] })
extern class Cleanup {

    @:native("Stop") function stop(): Void;

}