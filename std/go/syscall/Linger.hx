package go.syscall;

@:structInit
@:go.Type({ name: "Linger", instanceName: "syscall.Linger", imports: ["syscall"] })
extern class Linger {

    @:native("Onoff") var onoff: go.Int32;
    @:native("Linger") var linger: go.Int32;

    function new(onoff: go.Int32, linger: go.Int32);

}