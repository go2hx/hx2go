package go.runtime;

@:structInit
@:go.Type({ name: "pthreadmutexattr", instanceName: "runtime.pthreadmutexattr", imports: ["runtime"] })
extern class Pthreadmutexattr {

    @:native("X__sig") var x__sig: go.Int64;
    @:native("X__opaque") var x__opaque: go.GoArray<go.Int8, 8>;

    function new(x__sig: go.Int64, x__opaque: go.GoArray<go.Int8, 8>);

}