package go.crypto.tls;

/**
    CurveID is the type of a TLS identifier for a key exchange mechanism. See
    https://www.iana.org/assignments/tls-parameters/tls-parameters.xml#tls-parameters-8.
    
    In TLS 1.2, this registry used to support only elliptic curves. In TLS 1.3,
    it was extended to other groups and renamed NamedGroup. See RFC 8446, Section
    4.2.7. It was then also extended to other mechanisms, such as hybrid
    post-quantum KEMs.
**/
@:go.Type({ name: "CurveID", instanceName: "tls.CurveID", imports: ["crypto/tls"] })
extern typedef CurveID = haxe.extern.EitherType<go.UInt16, {
    @:native("String") function string(): (String);

}>