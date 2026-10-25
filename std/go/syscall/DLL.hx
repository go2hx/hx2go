package go.syscall;

/**
    A DLL implements access to a single DLL.
**/
@:structInit
@:go.Type({ name: "DLL", instanceName: "syscall.DLL", imports: ["syscall"] })
extern class DLL {

    @:native("Name") var name: String;
    @:native("Handle") var handle: go.syscall.Handle;

    function new(name: String="", handle: go.syscall.Handle=cast 0);

    /**
        FindProc searches [DLL] d for procedure named name and returns [*Proc]
        if found. It returns an error if search fails.
    **/
    @:native("FindProc") function findProc(name: String): (go.Result<go.Pointer<go.syscall.Proc>>);
    /**
        MustFindProc is like [DLL.FindProc] but panics if search fails.
    **/
    @:native("MustFindProc") function mustFindProc(name: String): (go.Pointer<go.syscall.Proc>);
    /**
        Release unloads [DLL] d from memory.
    **/
    @:native("Release") function release(): (go.Error);

}