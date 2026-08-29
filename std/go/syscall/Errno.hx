package go.syscall;

/**
    An Errno is an unsigned number describing an error condition.
    It implements the error interface. The zero Errno is by convention
    a non-error, so code to convert from Errno to error should use:
    
    	err = nil
    	if errno != 0 {
    		err = errno
    	}
    
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