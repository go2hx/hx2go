package go.crypto;

/**
    PublicKey represents a public key using an unspecified algorithm.
    
    Although this type is an empty interface for backwards compatibility reasons,
    all public key types in the standard library implement the following interface
    
    	interface{
    	    Equal(x crypto.PublicKey) bool
    	}
    
    which can be used for increased type safety within applications.
**/
@:go.Type({ name: "PublicKey", instanceName: "crypto.PublicKey", imports: ["crypto"] })
extern typedef PublicKey = {

}