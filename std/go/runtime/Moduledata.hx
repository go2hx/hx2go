package go.runtime;

@:structInit
@:go.Type({ name: "moduledata", instanceName: "runtime.moduledata", imports: ["runtime"] })
extern class Moduledata {

    @:native("NotInHeap") var notInHeap: Dynamic;

    function new(notInHeap: Dynamic);

}