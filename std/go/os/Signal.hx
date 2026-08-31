package go.os;

/**
    A Signal represents an operating system signal.
    The usual underlying implementation is operating system-dependent:
    on Unix it is syscall.Signal.
**/
@:go.Type({ name: "Signal", instanceName: "os.Signal", imports: ["os"] })
extern typedef Signal = {

    @:native("Signal") function signal(): Void;
    @:native("String") function string(): (String);

}