package go.runtime;

@:structInit
@:go.Type({ name: "pthreadattr", instanceName: "runtime.pthreadattr", imports: ["runtime"] })
extern class Pthreadattr {

    @:native("X__sig") var x__sig: go.Int64;
    @:native("X__opaque") var x__opaque: go.GoArray<go.Int8, 56>;

    function new(x__sig: go.Int64, x__opaque: go.GoArray<go.Int8, 56>);

}