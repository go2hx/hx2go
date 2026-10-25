package go.syscall;

@:structInit
@:go.Type({ name: "WSAData", instanceName: "syscall.WSAData", imports: ["syscall"] })
extern class WSAData {

    @:native("Version") var version: go.UInt16;
    @:native("HighVersion") var highVersion: go.UInt16;
    @:native("MaxSockets") var maxSockets: go.UInt16;
    @:native("MaxUdpDg") var maxUdpDg: go.UInt16;
    @:native("VendorInfo") var vendorInfo: go.Pointer<go.Byte>;
    @:native("Description") var description: go.GoArray<go.Byte, 257>;
    @:native("SystemStatus") var systemStatus: go.GoArray<go.Byte, 129>;

    function new(version: go.UInt16=0, highVersion: go.UInt16=0, maxSockets: go.UInt16=0, maxUdpDg: go.UInt16=0, vendorInfo: go.Pointer<go.Byte>=null, description: go.GoArray<go.Byte, 257>, systemStatus: go.GoArray<go.Byte, 129>);

}