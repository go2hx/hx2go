package go.syscall;

@:structInit
@:go.Type({ name: "MibIfRow", instanceName: "syscall.MibIfRow", imports: ["syscall"] })
extern class MibIfRow {

    @:native("Name") var name: go.GoArray<go.UInt16, 256>;
    @:native("Index") var index: go.UInt32;
    @:native("Type") var type: go.UInt32;
    @:native("Mtu") var mtu: go.UInt32;
    @:native("Speed") var speed: go.UInt32;
    @:native("PhysAddrLen") var physAddrLen: go.UInt32;
    @:native("PhysAddr") var physAddr: go.GoArray<go.Byte, 8>;
    @:native("AdminStatus") var adminStatus: go.UInt32;
    @:native("OperStatus") var operStatus: go.UInt32;
    @:native("LastChange") var lastChange: go.UInt32;
    @:native("InOctets") var inOctets: go.UInt32;
    @:native("InUcastPkts") var inUcastPkts: go.UInt32;
    @:native("InNUcastPkts") var inNUcastPkts: go.UInt32;
    @:native("InDiscards") var inDiscards: go.UInt32;
    @:native("InErrors") var inErrors: go.UInt32;
    @:native("InUnknownProtos") var inUnknownProtos: go.UInt32;
    @:native("OutOctets") var outOctets: go.UInt32;
    @:native("OutUcastPkts") var outUcastPkts: go.UInt32;
    @:native("OutNUcastPkts") var outNUcastPkts: go.UInt32;
    @:native("OutDiscards") var outDiscards: go.UInt32;
    @:native("OutErrors") var outErrors: go.UInt32;
    @:native("OutQLen") var outQLen: go.UInt32;
    @:native("DescrLen") var descrLen: go.UInt32;
    @:native("Descr") var descr: go.GoArray<go.Byte, 256>;

    function new(name: go.GoArray<go.UInt16, 256>, index: go.UInt32=0, type: go.UInt32=0, mtu: go.UInt32=0, speed: go.UInt32=0, physAddrLen: go.UInt32=0, physAddr: go.GoArray<go.Byte, 8>, adminStatus: go.UInt32=0, operStatus: go.UInt32=0, lastChange: go.UInt32=0, inOctets: go.UInt32=0, inUcastPkts: go.UInt32=0, inNUcastPkts: go.UInt32=0, inDiscards: go.UInt32=0, inErrors: go.UInt32=0, inUnknownProtos: go.UInt32=0, outOctets: go.UInt32=0, outUcastPkts: go.UInt32=0, outNUcastPkts: go.UInt32=0, outDiscards: go.UInt32=0, outErrors: go.UInt32=0, outQLen: go.UInt32=0, descrLen: go.UInt32=0, descr: go.GoArray<go.Byte, 256>);

}