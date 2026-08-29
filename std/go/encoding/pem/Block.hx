package go.encoding.pem;

/**
    A Block represents a PEM encoded structure.
    
    The encoded form is:
    
    	-----BEGIN Type-----
    	Headers
    	base64-encoded Bytes
    	-----END Type-----
    
    where [Block.Headers] is a possibly empty sequence of Key: Value lines.
**/
@:structInit
@:go.Type({ name: "Block", instanceName: "pem.Block", imports: ["encoding/pem"] })
extern class Block {

    @:native("Type") var type: String;
    @:native("Headers") var headers: go.Map<String, String>;
    @:native("Bytes") var bytes: go.Slice<go.Byte>;

    function new(type: String="", headers: go.Map<String, String>=null, bytes: go.Slice<go.Byte>=null);

}