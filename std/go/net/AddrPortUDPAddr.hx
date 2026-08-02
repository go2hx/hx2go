package go.net;

@:structInit
@:go.Type({ name: "addrPortUDPAddr", instanceName: "net.addrPortUDPAddr", imports: ["net"] })
extern class AddrPortUDPAddr {

    @:native("AddrPort") var addrPort: go.net.netip.AddrPort;

    function new(addrPort: go.net.netip.AddrPort);

    @:native("Addr") function addr(): (go.net.netip.Addr);
    @:native("AppendBinary") function appendBinary(b: go.Slice<go.Byte>): (go.Result<go.Slice<go.Byte>>);
    @:native("AppendText") function appendText(b: go.Slice<go.Byte>): (go.Result<go.Slice<go.Byte>>);
    @:native("AppendTo") function appendTo(b: go.Slice<go.Byte>): (go.Slice<go.Byte>);
    @:native("Compare") function compare(p2: go.net.netip.AddrPort): (go.GoInt);
    @:native("IsValid") function isValid(): (Bool);
    @:native("MarshalBinary") function marshalBinary(): (go.Result<go.Slice<go.Byte>>);
    @:native("MarshalText") function marshalText(): (go.Result<go.Slice<go.Byte>>);
    @:native("Network") function network(): (String);
    @:native("Port") function port(): (go.UInt16);
    @:native("String") function string(): (String);
    @:native("UnmarshalBinary") function unmarshalBinary(b: go.Slice<go.Byte>): (go.Error);
    @:native("UnmarshalText") function unmarshalText(text: go.Slice<go.Byte>): (go.Error);

}