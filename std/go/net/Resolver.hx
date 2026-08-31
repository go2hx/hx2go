package go.net;

/**
    A Resolver looks up names and numbers.
    
    A nil *Resolver is equivalent to a zero Resolver.
**/
@:structInit
@:go.Type({ name: "Resolver", instanceName: "net.Resolver", imports: ["net"] })
extern class Resolver {

    @:native("PreferGo") var preferGo: Bool;
    @:native("StrictErrors") var strictErrors: Bool;
    @:native("Dial") var dial: (ctx: go.context.Context, network: String, address: String) -> (go.Result<go.net.Conn>);

    function new(preferGo: Bool=false, strictErrors: Bool=false, dial: (ctx: go.context.Context, network: String, address: String) -> (go.Result<go.net.Conn>)=null);

    /**
        LookupAddr performs a reverse lookup for the given address, returning a list
        of names mapping to that address.
        
        The returned names are validated to be properly formatted presentation-format
        domain names. If the response contains invalid names, those records are filtered
        out and an error will be returned alongside the remaining results, if any.
    **/
    @:native("LookupAddr") function lookupAddr(ctx: go.context.Context, addr: String): (go.Result<go.Slice<String>>);
    /**
        LookupCNAME returns the canonical name for the given host.
        Callers that do not care about the canonical name can call
        [LookupHost] or [LookupIP] directly; both take care of resolving
        the canonical name as part of the lookup.
        
        A canonical name is the final name after following zero
        or more CNAME records.
        LookupCNAME does not return an error if host does not
        contain DNS "CNAME" records, as long as host resolves to
        address records.
        
        The returned canonical name is validated to be a properly
        formatted presentation-format domain name.
    **/
    @:native("LookupCNAME") function lookupCNAME(ctx: go.context.Context, host: String): (go.Result<String>);
    /**
        LookupHost looks up the given host using the local resolver.
        It returns a slice of that host's addresses.
    **/
    @:native("LookupHost") function lookupHost(ctx: go.context.Context, host: String): (go.Result<go.Slice<String>>);
    /**
        LookupIP looks up host for the given network using the local resolver.
        It returns a slice of that host's IP addresses of the type specified by
        network.
        network must be one of "ip", "ip4" or "ip6".
    **/
    @:native("LookupIP") function lookupIP(ctx: go.context.Context, network: String, host: String): (go.Result<go.Slice<go.net.IP>>);
    /**
        LookupIPAddr looks up host using the local resolver.
        It returns a slice of that host's IPv4 and IPv6 addresses.
    **/
    @:native("LookupIPAddr") function lookupIPAddr(ctx: go.context.Context, host: String): (go.Result<go.Slice<go.net.IPAddr>>);
    /**
        LookupMX returns the DNS MX records for the given domain name sorted by preference.
        
        The returned mail server names are validated to be properly
        formatted presentation-format domain names, or numeric IP addresses.
        If the response contains invalid names, those records are filtered out
        and an error will be returned alongside the remaining results, if any.
    **/
    @:native("LookupMX") function lookupMX(ctx: go.context.Context, name: String): (go.Result<go.Slice<go.Pointer<go.net.MX>>>);
    /**
        LookupNS returns the DNS NS records for the given domain name.
        
        The returned name server names are validated to be properly
        formatted presentation-format domain names. If the response contains
        invalid names, those records are filtered out and an error
        will be returned alongside the remaining results, if any.
    **/
    @:native("LookupNS") function lookupNS(ctx: go.context.Context, name: String): (go.Result<go.Slice<go.Pointer<go.net.NS>>>);
    /**
        LookupNetIP looks up host using the local resolver.
        It returns a slice of that host's IP addresses of the type specified by
        network.
        The network must be one of "ip", "ip4" or "ip6".
    **/
    @:native("LookupNetIP") function lookupNetIP(ctx: go.context.Context, network: String, host: String): (go.Result<go.Slice<go.net.netip.Addr>>);
    /**
        LookupPort looks up the port for the given network and service.
        
        The network must be one of "tcp", "tcp4", "tcp6", "udp", "udp4", "udp6" or "ip".
    **/
    @:native("LookupPort") function lookupPort(ctx: go.context.Context, network: String, service: String): (go.Result<go.GoInt>);
    /**
        LookupSRV tries to resolve an [SRV] query of the given service,
        protocol, and domain name. The proto is "tcp" or "udp".
        The returned records are sorted by priority and randomized
        by weight within a priority.
        
        LookupSRV constructs the DNS name to look up following RFC 2782.
        That is, it looks up _service._proto.name. To accommodate services
        publishing SRV records under non-standard names, if both service
        and proto are empty strings, LookupSRV looks up name directly.
        
        The returned service names are validated to be properly
        formatted presentation-format domain names. If the response contains
        invalid names, those records are filtered out and an error
        will be returned alongside the remaining results, if any.
    **/
    @:go.Tuple("p0", "p1", "p2") @:native("LookupSRV") function lookupSRV(ctx: go.context.Context, service: String, proto: String, name: String): (go.Tuple<{ p0: String, p1: go.Slice<go.Pointer<go.net.SRV>>, p2: go.Error }>);
    /**
        LookupTXT returns the DNS TXT records for the given domain name.
        
        If a DNS TXT record holds multiple strings, they are concatenated as a
        single string.
    **/
    @:native("LookupTXT") function lookupTXT(ctx: go.context.Context, name: String): (go.Result<go.Slice<String>>);

}