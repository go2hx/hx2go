package go.runtime;

@:structInit
@:go.Type({ name: "_func", instanceName: "runtime._func", imports: ["runtime"] })
extern class T_func {

    @:native("NotInHeap") var notInHeap: Dynamic;

    function new(notInHeap: Dynamic);

}