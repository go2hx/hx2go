package go.net.netip;

@:structInit
@:go.Type({ name: "AddrPort", instanceName: "netip.AddrPort", imports: ["net/netip"] })
extern class AddrPort {

    @:native("Addr") function addr(): go.net.netip.Addr;
    @:native("AppendBinary") function appendBinary(b: go.Slice<go.Byte>): go.Result<go.Slice<go.Byte>>;
    @:native("AppendText") function appendText(b: go.Slice<go.Byte>): go.Result<go.Slice<go.Byte>>;
    @:native("AppendTo") function appendTo(b: go.Slice<go.Byte>): go.Slice<go.Byte>;
    @:native("Compare") function compare(p2: go.net.netip.AddrPort): go.GoInt;
    @:native("IsValid") function isValid(): Bool;
    @:native("MarshalBinary") function marshalBinary(): go.Result<go.Slice<go.Byte>>;
    @:native("MarshalText") function marshalText(): go.Result<go.Slice<go.Byte>>;
    @:native("Port") function port(): go.UInt16;
    @:native("String") function string(): String;
    @:native("UnmarshalBinary") function unmarshalBinary(b: go.Slice<go.Byte>): go.Error;
    @:native("UnmarshalText") function unmarshalText(text: go.Slice<go.Byte>): go.Error;

}