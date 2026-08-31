package go.runtime;

/**
    A Func represents a Go function in the running binary.
**/
@:structInit
@:go.Type({ name: "Func", instanceName: "runtime.Func", imports: ["runtime"] })
extern class Func {

    /**
        Entry returns the entry address of the function.
    **/
    @:native("Entry") function entry(): (go.UIntPtr);
    /**
        FileLine returns the file name and line number of the
        source code corresponding to the program counter pc.
        The result will not be accurate if pc is not a program
        counter within f.
    **/
    @:go.Tuple("file", "line") @:native("FileLine") function fileLine(pc: go.UIntPtr): (go.Tuple<{ file: String, line: go.GoInt }>);
    /**
        Name returns the name of the function.
    **/
    @:native("Name") function name(): (String);

}