package go.crypto.rc4;

/**
    A Cipher is an instance of RC4 using a particular key.
**/
@:structInit
@:go.Type({ name: "Cipher", instanceName: "rc4.Cipher", imports: ["crypto/rc4"] })
extern class Cipher {

    /**
        Reset zeros the key data and makes the [Cipher] unusable.
        
        Deprecated: Reset can't guarantee that the key will be entirely removed from
        the process's memory.
    **/
    @:native("Reset") function reset(): Void;
    /**
        XORKeyStream sets dst to the result of XORing src with the key stream.
        Dst and src must overlap entirely or not at all.
    **/
    @:native("XORKeyStream") function xORKeyStream(dst: go.Slice<go.Byte>, src: go.Slice<go.Byte>): Void;

}