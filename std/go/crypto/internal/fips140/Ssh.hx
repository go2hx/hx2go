package go.crypto.internal.fips140;

@:go.Type({ name: "ssh", instanceName: "ssh.ssh", imports: ["crypto/internal/fips140/ssh"] })
extern class Ssh {

    @:native("ClientKeys") static var ClientKeys: go.crypto.internal.fips140.ssh.Direction;
    @:native("ServerKeys") static var ServerKeys: go.crypto.internal.fips140.ssh.Direction;

    @:go.Tuple("ivKey", "key", "macKey") @:native("Keys") static function keys<Hash: go.hash.Hash>(hash: () -> Hash, d: go.crypto.internal.fips140.ssh.Direction, K: go.Slice<go.Byte>, H: go.Slice<go.Byte>, sessionID: go.Slice<go.Byte>, ivKeyLen: go.GoInt, keyLen: go.GoInt, macKeyLen: go.GoInt): go.Tuple<{ ivKey: go.Slice<go.Byte>, key: go.Slice<go.Byte>, macKey: go.Slice<go.Byte> }>;

}