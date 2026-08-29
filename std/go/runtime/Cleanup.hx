package go.runtime;

/**
    Cleanup is a handle to a cleanup call for a specific object.
**/
@:structInit
@:go.Type({ name: "Cleanup", instanceName: "runtime.Cleanup", imports: ["runtime"] })
extern class Cleanup {

    /**
        Stop cancels the cleanup call. Stop will have no effect if the cleanup call
        has already been queued for execution (because ptr became unreachable).
        To guarantee that Stop removes the cleanup function, the caller must ensure
        that the pointer that was passed to AddCleanup is reachable across the call to Stop.
    **/
    @:native("Stop") function stop(): Void;

}