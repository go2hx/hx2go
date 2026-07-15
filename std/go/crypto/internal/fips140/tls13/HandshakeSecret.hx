package go.crypto.internal.fips140.tls13;

@:structInit
@:go.Type({ name: "HandshakeSecret", instanceName: "tls13.HandshakeSecret", imports: ["crypto/internal/fips140/tls13"] })
extern class HandshakeSecret {

    @:native("ClientHandshakeTrafficSecret") function clientHandshakeTrafficSecret(transcript: go.hash.Hash): go.Slice<go.Byte>;
    @:native("MasterSecret") function masterSecret(): go.Pointer<go.crypto.internal.fips140.tls13.MasterSecret>;
    @:native("ServerHandshakeTrafficSecret") function serverHandshakeTrafficSecret(transcript: go.hash.Hash): go.Slice<go.Byte>;

}