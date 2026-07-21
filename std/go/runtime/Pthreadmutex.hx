package go.runtime;

@:structInit
@:go.Type({ name: "pthreadmutex", instanceName: "runtime.pthreadmutex", imports: ["runtime"] })
extern class Pthreadmutex {

    @:native("X__sig") var x__sig: go.Int64;
    @:native("X__opaque") var x__opaque: go.GoArray<go.Int8, 56>;

    function new(x__sig: go.Int64, x__opaque: go.GoArray<go.Int8, 56>);

}