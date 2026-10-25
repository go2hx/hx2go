package go.syscall;

/**
    A LazyProc implements access to a procedure inside a [LazyDLL].
    It delays the lookup until the [LazyProc.Addr], [LazyProc.Call], or [LazyProc.Find] method is called.
**/
@:structInit
@:go.Type({ name: "LazyProc", instanceName: "syscall.LazyProc", imports: ["syscall"] })
extern class LazyProc {

    @:native("Name") var name: String;

    function new(name: String="");

    /**
        Addr returns the address of the procedure represented by p.
        The return value can be passed to Syscall to run the procedure.
    **/
    @:native("Addr") function addr(): (go.UIntPtr);
    /**
        Call executes procedure p with arguments a. See the documentation of
        Proc.Call for more information.
    **/
    @:go.Tuple("r1", "r2", "lastErr") @:native("Call") function call(a: haxe.Rest<go.UIntPtr>): (go.Tuple<{ r1: go.UIntPtr, r2: go.UIntPtr, lastErr: go.Error }>);
    /**
        Find searches [DLL] for procedure named p.Name. It returns
        an error if search fails. Find will not search procedure,
        if it is already found and loaded into memory.
    **/
    @:native("Find") function find(): (go.Error);

}