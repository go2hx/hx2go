package go.runtime;

@:structInit
@:go.Type({ name: "funcInfo", instanceName: "runtime.funcInfo", imports: ["runtime"] })
extern class FuncInfo {

    @:native("NotInHeap") var notInHeap: Dynamic;

}