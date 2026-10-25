package go.syscall;

@:structInit
@:go.Type({ name: "Tokenuser", instanceName: "syscall.Tokenuser", imports: ["syscall"] })
extern class Tokenuser_ {

    @:native("User") var user: go.syscall.SIDAndAttributes;

    function new(user: go.syscall.SIDAndAttributes);

}