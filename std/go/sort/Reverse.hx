package go.sort;

@:structInit
@:go.Type({ name: "reverse", instanceName: "sort.reverse", imports: ["sort"] })
extern class Reverse {

    @:native("Interface") var _interface: go.sort.Interface;

    function new(_interface: go.sort.Interface);

    @:native("Len") function len(): (go.GoInt);
    @:native("Less") function less(i: go.GoInt, j: go.GoInt): (Bool);
    @:native("Swap") function swap(i: go.GoInt, j: go.GoInt): Void;

}