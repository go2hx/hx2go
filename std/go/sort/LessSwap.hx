package go.sort;

@:structInit
@:go.Type({ name: "lessSwap", instanceName: "sort.lessSwap", imports: ["sort"] })
extern class LessSwap {

    @:native("Less") var less: (i: go.GoInt, j: go.GoInt) -> (Bool);
    @:native("Swap") var swap: (i: go.GoInt, j: go.GoInt) -> Void;

    function new(less: (i: go.GoInt, j: go.GoInt) -> (Bool), swap: (i: go.GoInt, j: go.GoInt) -> Void);

}