package go.crypto;

@:go.Type({ name: "Hash", instanceName: "crypto.Hash", imports: ["crypto"] })
extern typedef Hash = haxe.extern.EitherType<go.GoUInt, {
    @:native("Available") function available(): (Bool);
    @:native("HashFunc") function hashFunc(): (go.crypto.Hash);
    @:native("New") function _new(): (go.hash.Hash);
    @:native("Size") function size(): (go.GoInt);
    @:native("String") function string(): (String);

}>