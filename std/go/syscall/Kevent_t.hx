package go.syscall;

@:structInit
@:go.Type({ name: "Kevent_t", instanceName: "syscall.Kevent_t", imports: ["syscall"] })
extern class Kevent_t {

    @:native("Ident") var ident: go.UInt64;
    @:native("Filter") var filter: go.Int16;
    @:native("Flags") var flags: go.UInt16;
    @:native("Fflags") var fflags: go.UInt32;
    @:native("Data") var data: go.Int64;
    @:native("Udata") var udata: go.Pointer<go.Byte>;

    function new(ident: go.UInt64, filter: go.Int16, flags: go.UInt16, fflags: go.UInt32, data: go.Int64, udata: go.Pointer<go.Byte>);

}