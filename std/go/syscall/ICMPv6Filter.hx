package go.syscall;

@:structInit
@:go.Type({ name: "ICMPv6Filter", instanceName: "syscall.ICMPv6Filter", imports: ["syscall"] })
extern class ICMPv6Filter {

    @:native("Data") var data: go.GoArray<go.UInt32, 8>;

function new(data: go.GoArray<go.UInt32, 8>);

}