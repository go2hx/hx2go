package go.syscall;

@:structInit
@:go.Type({ name: "AddrinfoW", instanceName: "syscall.AddrinfoW", imports: ["syscall"] })
extern class AddrinfoW {

    @:native("Flags") var flags: go.Int32;
    @:native("Family") var family: go.Int32;
    @:native("Socktype") var socktype: go.Int32;
    @:native("Protocol") var protocol: go.Int32;
    @:native("Addrlen") var addrlen: go.UIntPtr;
    @:native("Canonname") var canonname: go.Pointer<go.UInt16>;
    @:native("Addr") var addr: go.syscall.Pointer;
    @:native("Next") var next: go.Pointer<go.syscall.AddrinfoW>;

    function new(flags: go.Int32=0, family: go.Int32=0, socktype: go.Int32=0, protocol: go.Int32=0, addrlen: go.UIntPtr=0, canonname: go.Pointer<go.UInt16>=null, addr: go.syscall.Pointer=null, next: go.Pointer<go.syscall.AddrinfoW>=null);

}