package go.runtime;

@:structInit
@:go.Type({ name: "pthreadcondattr", instanceName: "runtime.pthreadcondattr", imports: ["runtime"] })
extern class Pthreadcondattr {

    @:native("X__sig") var x__sig: go.Int64;
    @:native("X__opaque") var x__opaque: go.GoArray<go.Int8, 8>;

    function new(x__sig: go.Int64, x__opaque: go.GoArray<go.Int8, 8>);

}