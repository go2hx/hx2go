package go.runtime;

@:structInit
@:go.Type({ name: "Frame", instanceName: "runtime.Frame", imports: ["runtime"] })
extern class Frame {

    @:native("PC") var PC: go.UIntPtr;
    @:native("Func") var func: go.Pointer<go.runtime.Func>;
    @:native("Function") var _function: String;
    @:native("File") var file: String;
    @:native("Line") var line: go.GoInt;
    @:native("Entry") var entry: go.UIntPtr;

    function new(PC: go.UIntPtr, func: go.Pointer<go.runtime.Func>, _function: String, file: String, line: go.GoInt, entry: go.UIntPtr);

}