package go.syscall;

/**
    A LazyDLL implements access to a single [DLL].
    It will delay the load of the DLL until the first
    call to its [LazyDLL.Handle] method or to one of its
    [LazyProc]'s Addr method.
    
    LazyDLL is subject to the same DLL preloading attacks as documented
    on [LoadDLL].
    
    Use LazyDLL in golang.org/x/sys/windows for a secure way to
    load system DLLs.
**/
@:structInit
@:go.Type({ name: "LazyDLL", instanceName: "syscall.LazyDLL", imports: ["syscall"] })
extern class LazyDLL {

    @:native("Name") var name: String;

    function new(name: String="");

    /**
        Handle returns d's module handle.
    **/
    @:native("Handle") function handle(): (go.UIntPtr);
    /**
        Load loads DLL file d.Name into memory. It returns an error if fails.
        Load will not try to load DLL, if it is already loaded into memory.
    **/
    @:native("Load") function load(): (go.Error);
    /**
        NewProc returns a [LazyProc] for accessing the named procedure in the [DLL] d.
    **/
    @:native("NewProc") function newProc(name: String): (go.Pointer<go.syscall.LazyProc>);

}