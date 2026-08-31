package go.crypto;

/**
    Hash identifies a cryptographic hash function that is implemented in another
    package.
**/
@:go.Type({ name: "Hash", instanceName: "crypto.Hash", imports: ["crypto"] })
extern typedef Hash = haxe.extern.EitherType<go.GoUInt, {
    /**
        Available reports whether the given hash function is linked into the binary.
    **/
    @:native("Available") function available(): (Bool);
    /**
        HashFunc simply returns the value of h so that [Hash] implements [SignerOpts].
    **/
    @:native("HashFunc") function hashFunc(): (go.crypto.Hash);
    /**
        New returns a new hash.Hash calculating the given hash function. New panics
        if the hash function is not linked into the binary.
    **/
    @:native("New") function _new(): (go.hash.Hash);
    /**
        Size returns the length, in bytes, of a digest resulting from the given hash
        function. It doesn't require that the hash function in question be linked
        into the program.
    **/
    @:native("Size") function size(): (go.GoInt);
    @:native("String") function string(): (String);

}>