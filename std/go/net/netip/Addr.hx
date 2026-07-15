package go.net.netip;

@:structInit
@:go.Type({ name: "Addr", instanceName: "netip.Addr", imports: ["net/netip"] })
extern class Addr {

    @:native("AppendBinary") function appendBinary(b: go.Slice<go.Byte>): go.Result<go.Slice<go.Byte>>;
    @:native("AppendText") function appendText(b: go.Slice<go.Byte>): go.Result<go.Slice<go.Byte>>;
    @:native("AppendTo") function appendTo(b: go.Slice<go.Byte>): go.Slice<go.Byte>;
    @:native("As16") function as16(): go.GoArray<go.Byte, 16>;
    @:native("As4") function as4(): go.GoArray<go.Byte, 4>;
    @:native("AsSlice") function asSlice(): go.Slice<go.Byte>;
    @:native("BitLen") function bitLen(): go.GoInt;
    @:native("Compare") function compare(ip2: go.net.netip.Addr): go.GoInt;
    @:native("Is4") function is4(): Bool;
    @:native("Is4In6") function is4In6(): Bool;
    @:native("Is6") function is6(): Bool;
    @:native("IsGlobalUnicast") function isGlobalUnicast(): Bool;
    @:native("IsInterfaceLocalMulticast") function isInterfaceLocalMulticast(): Bool;
    @:native("IsLinkLocalMulticast") function isLinkLocalMulticast(): Bool;
    @:native("IsLinkLocalUnicast") function isLinkLocalUnicast(): Bool;
    @:native("IsLoopback") function isLoopback(): Bool;
    @:native("IsMulticast") function isMulticast(): Bool;
    @:native("IsPrivate") function isPrivate(): Bool;
    @:native("IsUnspecified") function isUnspecified(): Bool;
    @:native("IsValid") function isValid(): Bool;
    @:native("Less") function less(ip2: go.net.netip.Addr): Bool;
    @:native("MarshalBinary") function marshalBinary(): go.Result<go.Slice<go.Byte>>;
    @:native("MarshalText") function marshalText(): go.Result<go.Slice<go.Byte>>;
    @:native("Next") function next(): go.net.netip.Addr;
    @:native("Prefix") function prefix(b: go.GoInt): go.Result<go.net.netip.Prefix>;
    @:native("Prev") function prev(): go.net.netip.Addr;
    @:native("String") function string(): String;
    @:native("StringExpanded") function stringExpanded(): String;
    @:native("Unmap") function unmap(): go.net.netip.Addr;
    @:native("UnmarshalBinary") function unmarshalBinary(b: go.Slice<go.Byte>): go.Error;
    @:native("UnmarshalText") function unmarshalText(text: go.Slice<go.Byte>): go.Error;
    @:native("WithZone") function withZone(zone: String): go.net.netip.Addr;
    @:native("Zone") function zone(): String;

}