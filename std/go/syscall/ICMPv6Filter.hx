package go.syscall;

@:structInit
@:go.Type({ name: "ICMPv6Filter", instanceName: "syscall.ICMPv6Filter", imports: ["syscall"] })
extern class ICMPv6Filter {

    @:native("Filt") var filt: go.GoArray<go.UInt32, 8>;

    function new(filt: go.GoArray<go.UInt32, 8>);

}