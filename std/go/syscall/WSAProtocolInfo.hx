package go.syscall;

@:structInit
@:go.Type({ name: "WSAProtocolInfo", instanceName: "syscall.WSAProtocolInfo", imports: ["syscall"] })
extern class WSAProtocolInfo {

    @:native("ServiceFlags1") var serviceFlags1: go.UInt32;
    @:native("ServiceFlags2") var serviceFlags2: go.UInt32;
    @:native("ServiceFlags3") var serviceFlags3: go.UInt32;
    @:native("ServiceFlags4") var serviceFlags4: go.UInt32;
    @:native("ProviderFlags") var providerFlags: go.UInt32;
    @:native("ProviderId") var providerId: go.syscall.GUID;
    @:native("CatalogEntryId") var catalogEntryId: go.UInt32;
    @:native("ProtocolChain") var protocolChain: go.syscall.WSAProtocolChain;
    @:native("Version") var version: go.Int32;
    @:native("AddressFamily") var addressFamily: go.Int32;
    @:native("MaxSockAddr") var maxSockAddr: go.Int32;
    @:native("MinSockAddr") var minSockAddr: go.Int32;
    @:native("SocketType") var socketType: go.Int32;
    @:native("Protocol") var protocol: go.Int32;
    @:native("ProtocolMaxOffset") var protocolMaxOffset: go.Int32;
    @:native("NetworkByteOrder") var networkByteOrder: go.Int32;
    @:native("SecurityScheme") var securityScheme: go.Int32;
    @:native("MessageSize") var messageSize: go.UInt32;
    @:native("ProviderReserved") var providerReserved: go.UInt32;
    @:native("ProtocolName") var protocolName: go.GoArray<go.UInt16, 256>;

    function new(serviceFlags1: go.UInt32=0, serviceFlags2: go.UInt32=0, serviceFlags3: go.UInt32=0, serviceFlags4: go.UInt32=0, providerFlags: go.UInt32=0, providerId: go.syscall.GUID, catalogEntryId: go.UInt32=0, protocolChain: go.syscall.WSAProtocolChain, version: go.Int32=0, addressFamily: go.Int32=0, maxSockAddr: go.Int32=0, minSockAddr: go.Int32=0, socketType: go.Int32=0, protocol: go.Int32=0, protocolMaxOffset: go.Int32=0, networkByteOrder: go.Int32=0, securityScheme: go.Int32=0, messageSize: go.UInt32=0, providerReserved: go.UInt32=0, protocolName: go.GoArray<go.UInt16, 256>);

}