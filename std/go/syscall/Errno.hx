package go.syscall;

@:go.Type({ name: "Errno", instanceName: "syscall.Errno", imports: ["syscall"] })
extern typedef Errno = haxe.extern.EitherType<go.UIntPtr, {
    @:native("Error") function error(): (String);
    @:native("Is") function _is(target: go.Error): (Bool);
    @:native("Temporary") function temporary(): (Bool);
    @:native("Timeout") function timeout(): (Bool);

}>