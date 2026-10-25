package go.syscall;

@:structInit
@:go.Type({ name: "IpAdapterInfo", instanceName: "syscall.IpAdapterInfo", imports: ["syscall"] })
extern class IpAdapterInfo {

    @:native("Next") var next: go.Pointer<go.syscall.IpAdapterInfo>;
    @:native("ComboIndex") var comboIndex: go.UInt32;
    @:native("AdapterName") var adapterName: go.GoArray<go.Byte, 260>;
    @:native("Description") var description: go.GoArray<go.Byte, 132>;
    @:native("AddressLength") var addressLength: go.UInt32;
    @:native("Address") var address: go.GoArray<go.Byte, 8>;
    @:native("Index") var index: go.UInt32;
    @:native("Type") var type: go.UInt32;
    @:native("DhcpEnabled") var dhcpEnabled: go.UInt32;
    @:native("CurrentIpAddress") var currentIpAddress: go.Pointer<go.syscall.IpAddrString>;
    @:native("IpAddressList") var ipAddressList: go.syscall.IpAddrString;
    @:native("GatewayList") var gatewayList: go.syscall.IpAddrString;
    @:native("DhcpServer") var dhcpServer: go.syscall.IpAddrString;
    @:native("HaveWins") var haveWins: Bool;
    @:native("PrimaryWinsServer") var primaryWinsServer: go.syscall.IpAddrString;
    @:native("SecondaryWinsServer") var secondaryWinsServer: go.syscall.IpAddrString;
    @:native("LeaseObtained") var leaseObtained: go.Int64;
    @:native("LeaseExpires") var leaseExpires: go.Int64;

    function new(next: go.Pointer<go.syscall.IpAdapterInfo>=null, comboIndex: go.UInt32=0, adapterName: go.GoArray<go.Byte, 260>, description: go.GoArray<go.Byte, 132>, addressLength: go.UInt32=0, address: go.GoArray<go.Byte, 8>, index: go.UInt32=0, type: go.UInt32=0, dhcpEnabled: go.UInt32=0, currentIpAddress: go.Pointer<go.syscall.IpAddrString>=null, ipAddressList: go.syscall.IpAddrString, gatewayList: go.syscall.IpAddrString, dhcpServer: go.syscall.IpAddrString, haveWins: Bool=false, primaryWinsServer: go.syscall.IpAddrString, secondaryWinsServer: go.syscall.IpAddrString, leaseObtained: go.Int64=0, leaseExpires: go.Int64=0);

}