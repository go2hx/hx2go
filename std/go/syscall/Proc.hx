package go.syscall;

/**
    A Proc implements access to a procedure inside a [DLL].
**/
@:structInit
@:go.Type({ name: "Proc", instanceName: "syscall.Proc", imports: ["syscall"] })
extern class Proc {

    @:native("Dll") var dll: go.Pointer<go.syscall.DLL>;
    @:native("Name") var name: String;

    function new(dll: go.Pointer<go.syscall.DLL>=null, name: String="");

    /**
        Addr returns the address of the procedure represented by p.
        The return value can be passed to Syscall to run the procedure.
    **/
    @:native("Addr") function addr(): (go.UIntPtr);
    /**
        Call executes procedure p with arguments a.
        
        The returned error is always non-nil, constructed from the result of GetLastError.
        Callers must inspect the primary return value to decide whether an error occurred
        (according to the semantics of the specific function being called) before consulting
        the error. The error always has type [Errno].
        
        On amd64, Call can pass and return floating-point values. To pass
        an argument x with C type "float", use
        uintptr(math.Float32bits(x)). To pass an argument with C type
        "double", use uintptr(math.Float64bits(x)). Floating-point return
        values are returned in r2. The return value for C type "float" is
        [math.Float32frombits](uint32(r2)). For C type "double", it is
        [math.Float64frombits](uint64(r2)).
    **/
    @:go.Tuple("p0", "p1", "p2") @:native("Call") function call(a: haxe.Rest<go.UIntPtr>): (go.Tuple<{ p0: go.UIntPtr, p1: go.UIntPtr, p2: go.Error }>);

}