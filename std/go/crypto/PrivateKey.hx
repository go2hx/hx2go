package go.crypto;

/**
    PrivateKey represents a private key using an unspecified algorithm.
    
    Although this type is an empty interface for backwards compatibility reasons,
    all private key types in the standard library implement the following interface
    
    	interface{
    	    Public() crypto.PublicKey
    	    Equal(x crypto.PrivateKey) bool
    	}
    
    as well as purpose-specific interfaces such as [Signer] and [Decrypter], which
    can be used for increased type safety within applications.
**/
@:go.Type({ name: "PrivateKey", instanceName: "crypto.PrivateKey", imports: ["crypto"] })
extern typedef PrivateKey = {

}