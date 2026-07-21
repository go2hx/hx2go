package go.runtime;

@:structInit
@:go.Type({ name: "pthreadcond", instanceName: "runtime.pthreadcond", imports: ["runtime"] })
extern class Pthreadcond {

    @:native("X__sig") var x__sig: go.Int64;
    @:native("X__opaque") var x__opaque: go.GoArray<go.Int8, 40>;

    function new(x__sig: go.Int64, x__opaque: go.GoArray<go.Int8, 40>);

}