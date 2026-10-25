package go.syscall;

@:structInit
@:go.Type({ name: "Tokenprimarygroup", instanceName: "syscall.Tokenprimarygroup", imports: ["syscall"] })
extern class Tokenprimarygroup_ {

    @:native("PrimaryGroup") var primaryGroup: go.Pointer<go.syscall.SID>;

    function new(primaryGroup: go.Pointer<go.syscall.SID>=null);

}