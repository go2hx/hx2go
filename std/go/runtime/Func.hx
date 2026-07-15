package go.runtime;

@:structInit
@:go.Type({ name: "Func", instanceName: "runtime.Func", imports: ["runtime"] })
extern class Func {

    @:native("Entry") function entry(): go.UIntPtr;
    @:go.Tuple("file", "line") @:native("FileLine") function fileLine(pc: go.UIntPtr): go.Tuple<{ file: String, line: go.GoInt }>;
    @:native("Name") function name(): String;

}