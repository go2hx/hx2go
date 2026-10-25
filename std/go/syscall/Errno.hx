package go.syscall;

/**
    Errno is the Windows error number.
    
    Errno values can be tested against error values using [errors.Is].
    For example:
    
    	_, _, err := syscall.Syscall(...)
    	if errors.Is(err, fs.ErrNotExist) ...
**/
@:go.Type({ name: "Errno", instanceName: "syscall.Errno", imports: ["syscall"] })
extern typedef Errno = haxe.extern.EitherType<go.UIntPtr, {
    @:native("Error") function error(): (String);
    @:native("Is") function _is(target: go.Error): (Bool);
    @:native("Temporary") function temporary(): (Bool);
    @:native("Timeout") function timeout(): (Bool);

}>