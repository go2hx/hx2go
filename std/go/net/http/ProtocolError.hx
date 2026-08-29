package go.net.http;

/**
    ProtocolError represents an HTTP protocol error.
    
    Deprecated: Not all errors in the http package related to protocol errors
    are of type ProtocolError.
**/
@:structInit
@:go.Type({ name: "ProtocolError", instanceName: "http.ProtocolError", imports: ["net/http"] })
extern class ProtocolError {

    @:native("ErrorString") var errorString: String;

    function new(errorString: String="");

    @:native("Error") function error(): (String);
    /**
        Is lets http.ErrNotSupported match errors.ErrUnsupported.
    **/
    @:native("Is") function _is(err: go.Error): (Bool);

}