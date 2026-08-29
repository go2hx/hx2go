package go.crypto;

/**
    Package hmac implements the Keyed-Hash Message Authentication Code (HMAC) as
    defined in U.S. Federal Information Processing Standards Publication 198.
    An HMAC is a cryptographic hash that uses a key to sign a message.
    The receiver verifies the hash by recomputing it using the same key.
    
    Receivers should be careful to use Equal to compare MACs in order to avoid
    timing side-channels:
    
    	// ValidMAC reports whether messageMAC is a valid HMAC tag for message.
    	func ValidMAC(message, messageMAC, key []byte) bool {
    		mac := hmac.New(sha256.New, key)
    		mac.Write(message)
    		expectedMAC := mac.Sum(nil)
    		return hmac.Equal(messageMAC, expectedMAC)
    	}
**/
@:go.Type({ name: "hmac", instanceName: "hmac.hmac", imports: ["crypto/hmac"] })
extern class Hmac {

    /**
        Equal compares two MACs for equality without leaking timing information.
    **/
    @:native("Equal") static function equal(mac1: go.Slice<go.Byte>, mac2: go.Slice<go.Byte>): (Bool);
    /**
        New returns a new HMAC hash using the given [hash.Hash] type and key.
        New functions like [crypto/sha256.New] can be used as h.
        h must return a new Hash every time it is called.
        Note that unlike other hash implementations in the standard library,
        the returned Hash does not implement [encoding.BinaryMarshaler]
        or [encoding.BinaryUnmarshaler].
    **/
    @:native("New") static function _new(h: () -> (go.hash.Hash), key: go.Slice<go.Byte>): (go.hash.Hash);

}