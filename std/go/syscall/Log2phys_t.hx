package go.syscall;

@:structInit
@:go.Type({ name: "Log2phys_t", instanceName: "syscall.Log2phys_t", imports: ["syscall"] })
extern class Log2phys_t {

    @:native("Flags") var flags: go.UInt32;
    @:native("Contigbytes") var contigbytes: go.Int64;
    @:native("Devoffset") var devoffset: go.Int64;

    function new(flags: go.UInt32, contigbytes: go.Int64, devoffset: go.Int64);

}