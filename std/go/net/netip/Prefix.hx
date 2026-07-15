package go.net.netip;

@:structInit
@:go.Type({ name: "Prefix", instanceName: "netip.Prefix", imports: ["net/netip"] })
extern class Prefix {

    @:native("Addr") function addr(): go.net.netip.Addr;
    @:native("AppendBinary") function appendBinary(b: go.Slice<go.Byte>): go.Result<go.Slice<go.Byte>>;
    @:native("AppendText") function appendText(b: go.Slice<go.Byte>): go.Result<go.Slice<go.Byte>>;
    @:native("AppendTo") function appendTo(b: go.Slice<go.Byte>): go.Slice<go.Byte>;
    @:native("Bits") function bits(): go.GoInt;
    @:native("Compare") function compare(p2: go.net.netip.Prefix): go.GoInt;
    @:native("Contains") function contains(ip: go.net.netip.Addr): Bool;
    @:native("IsSingleIP") function isSingleIP(): Bool;
    @:native("IsValid") function isValid(): Bool;
    @:native("MarshalBinary") function marshalBinary(): go.Result<go.Slice<go.Byte>>;
    @:native("MarshalText") function marshalText(): go.Result<go.Slice<go.Byte>>;
    @:native("Masked") function masked(): go.net.netip.Prefix;
    @:native("Overlaps") function overlaps(o: go.net.netip.Prefix): Bool;
    @:native("String") function string(): String;
    @:native("UnmarshalBinary") function unmarshalBinary(b: go.Slice<go.Byte>): go.Error;
    @:native("UnmarshalText") function unmarshalText(text: go.Slice<go.Byte>): go.Error;

}