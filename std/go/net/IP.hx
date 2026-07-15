package go.net;

@:go.Type({ name: "IP", instanceName: "net.IP", imports: ["net"] })
extern class IP {

    @:native("AppendText") function appendText(b: go.Slice<go.Byte>): go.Result<go.Slice<go.Byte>>;
    @:native("DefaultMask") function defaultMask(): go.net.IPMask;
    @:native("Equal") function equal(x: go.net.IP): Bool;
    @:native("IsGlobalUnicast") function isGlobalUnicast(): Bool;
    @:native("IsInterfaceLocalMulticast") function isInterfaceLocalMulticast(): Bool;
    @:native("IsLinkLocalMulticast") function isLinkLocalMulticast(): Bool;
    @:native("IsLinkLocalUnicast") function isLinkLocalUnicast(): Bool;
    @:native("IsLoopback") function isLoopback(): Bool;
    @:native("IsMulticast") function isMulticast(): Bool;
    @:native("IsPrivate") function isPrivate(): Bool;
    @:native("IsUnspecified") function isUnspecified(): Bool;
    @:native("MarshalText") function marshalText(): go.Result<go.Slice<go.Byte>>;
    @:native("Mask") function mask(mask: go.net.IPMask): go.net.IP;
    @:native("String") function string(): String;
    @:native("To16") function to16(): go.net.IP;
    @:native("To4") function to4(): go.net.IP;
    @:native("UnmarshalText") function unmarshalText(text: go.Slice<go.Byte>): go.Error;

}