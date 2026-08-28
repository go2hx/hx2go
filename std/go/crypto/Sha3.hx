package go.crypto;

/**
    Package sha3 implements the SHA-3 hash algorithms and the SHAKE extendable
    output functions defined in FIPS 202.
**/
@:go.Type({ name: "sha3", instanceName: "sha3.sha3", imports: ["crypto/sha3"] })
extern class Sha3 {

    /**
        New224 creates a new SHA3-224 hash.
    **/
    @:native("New224") static function new224(): (go.Pointer<go.crypto.sha3.SHA3>);
    /**
        New256 creates a new SHA3-256 hash.
    **/
    @:native("New256") static function new256(): (go.Pointer<go.crypto.sha3.SHA3>);
    /**
        New384 creates a new SHA3-384 hash.
    **/
    @:native("New384") static function new384(): (go.Pointer<go.crypto.sha3.SHA3>);
    /**
        New512 creates a new SHA3-512 hash.
    **/
    @:native("New512") static function new512(): (go.Pointer<go.crypto.sha3.SHA3>);
    /**
        NewCSHAKE128 creates a new cSHAKE128 XOF.
        
        N is used to define functions based on cSHAKE, it can be empty when plain
        cSHAKE is desired. S is a customization byte string used for domain
        separation. When N and S are both empty, this is equivalent to NewSHAKE128.
    **/
    @:native("NewCSHAKE128") static function newCSHAKE128(N: go.Slice<go.Byte>, S: go.Slice<go.Byte>): (go.Pointer<go.crypto.sha3.SHAKE>);
    /**
        NewCSHAKE256 creates a new cSHAKE256 XOF.
        
        N is used to define functions based on cSHAKE, it can be empty when plain
        cSHAKE is desired. S is a customization byte string used for domain
        separation. When N and S are both empty, this is equivalent to NewSHAKE256.
    **/
    @:native("NewCSHAKE256") static function newCSHAKE256(N: go.Slice<go.Byte>, S: go.Slice<go.Byte>): (go.Pointer<go.crypto.sha3.SHAKE>);
    /**
        NewSHAKE128 creates a new SHAKE128 XOF.
    **/
    @:native("NewSHAKE128") static function newSHAKE128(): (go.Pointer<go.crypto.sha3.SHAKE>);
    /**
        NewSHAKE256 creates a new SHAKE256 XOF.
    **/
    @:native("NewSHAKE256") static function newSHAKE256(): (go.Pointer<go.crypto.sha3.SHAKE>);
    /**
        Sum224 returns the SHA3-224 hash of data.
    **/
    @:native("Sum224") static function sum224(data: go.Slice<go.Byte>): (go.GoArray<go.Byte, 28>);
    /**
        Sum256 returns the SHA3-256 hash of data.
    **/
    @:native("Sum256") static function sum256(data: go.Slice<go.Byte>): (go.GoArray<go.Byte, 32>);
    /**
        Sum384 returns the SHA3-384 hash of data.
    **/
    @:native("Sum384") static function sum384(data: go.Slice<go.Byte>): (go.GoArray<go.Byte, 48>);
    /**
        Sum512 returns the SHA3-512 hash of data.
    **/
    @:native("Sum512") static function sum512(data: go.Slice<go.Byte>): (go.GoArray<go.Byte, 64>);
    /**
        SumSHAKE128 applies the SHAKE128 extendable output function to data and
        returns an output of the given length in bytes.
    **/
    @:native("SumSHAKE128") static function sumSHAKE128(data: go.Slice<go.Byte>, length: go.GoInt): (go.Slice<go.Byte>);
    /**
        SumSHAKE256 applies the SHAKE256 extendable output function to data and
        returns an output of the given length in bytes.
    **/
    @:native("SumSHAKE256") static function sumSHAKE256(data: go.Slice<go.Byte>, length: go.GoInt): (go.Slice<go.Byte>);

}