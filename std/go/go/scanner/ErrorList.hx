package go.go.scanner;

@:go.Type({ name: "ErrorList", instanceName: "scanner.ErrorList", imports: ["go/scanner"] })
extern class ErrorList {

    @:native("Add") function add(pos: go.go.token.Position, msg: String): Void;
    @:native("Err") function err(): (go.Error);
    @:native("Error") function error(): (String);
    @:native("Len") function len(): (go.GoInt);
    @:native("Less") function less(i: go.GoInt, j: go.GoInt): (Bool);
    @:native("RemoveMultiples") function removeMultiples(): Void;
    @:native("Reset") function reset(): Void;
    @:native("Sort") function sort(): Void;
    @:native("Swap") function swap(i: go.GoInt, j: go.GoInt): Void;

}