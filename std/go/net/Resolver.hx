package go.net;

@:structInit
@:go.Type({ name: "Resolver", instanceName: "net.Resolver", imports: ["net"] })
extern class Resolver {

    @:native("PreferGo") var preferGo: Bool;
    @:native("StrictErrors") var strictErrors: Bool;
    @:native("Dial") var dial: (ctx: go.context.Context, network: String, address: String) -> go.Result<go.net.Conn>;

function new(preferGo: Bool, strictErrors: Bool, dial: (ctx: go.context.Context, network: String, address: String) -> go.Result<go.net.Conn>);

    @:native("LookupAddr") function lookupAddr(ctx: go.context.Context, addr: String): go.Result<go.Slice<String>>;
    @:native("LookupCNAME") function lookupCNAME(ctx: go.context.Context, host: String): go.Result<String>;
    @:native("LookupHost") function lookupHost(ctx: go.context.Context, host: String): go.Result<go.Slice<String>>;
    @:native("LookupIP") function lookupIP(ctx: go.context.Context, network: String, host: String): go.Result<go.Slice<go.net.IP>>;
    @:native("LookupIPAddr") function lookupIPAddr(ctx: go.context.Context, host: String): go.Result<go.Slice<go.net.IPAddr>>;
    @:native("LookupMX") function lookupMX(ctx: go.context.Context, name: String): go.Result<go.Slice<go.Pointer<go.net.MX>>>;
    @:native("LookupNS") function lookupNS(ctx: go.context.Context, name: String): go.Result<go.Slice<go.Pointer<go.net.NS>>>;
    @:native("LookupNetIP") function lookupNetIP(ctx: go.context.Context, network: String, host: String): go.Result<go.Slice<go.net.netip.Addr>>;
    @:native("LookupPort") function lookupPort(ctx: go.context.Context, network: String, service: String): go.Result<go.GoInt>;
    @:go.Tuple("p0", "p1", "p2") @:native("LookupSRV") function lookupSRV(ctx: go.context.Context, service: String, proto: String, name: String): go.Tuple<{ p0: String, p1: go.Slice<go.Pointer<go.net.SRV>>, p2: go.Error }>;
    @:native("LookupTXT") function lookupTXT(ctx: go.context.Context, name: String): go.Result<go.Slice<String>>;

}