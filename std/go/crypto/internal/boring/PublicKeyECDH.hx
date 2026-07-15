package go.crypto.internal.boring;

@:structInit
@:go.Type({ name: "PublicKeyECDH", instanceName: "boring.PublicKeyECDH", imports: ["crypto/internal/boring"] })
extern class PublicKeyECDH {

    @:native("Bytes") function bytes(): go.Slice<go.Byte>;

}