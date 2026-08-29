package go.crypto.tls;

/**
    ECHRejectionError is the error type returned when ECH is rejected by a remote
    server. If the server offered a ECHConfigList to use for retries, the
    RetryConfigList field will contain this list.
    
    The client may treat an ECHRejectionError with an empty set of RetryConfigs
    as a secure signal from the server.
**/
@:structInit
@:go.Type({ name: "ECHRejectionError", instanceName: "tls.ECHRejectionError", imports: ["crypto/tls"] })
extern class ECHRejectionError {

    @:native("RetryConfigList") var retryConfigList: go.Slice<go.Byte>;

    function new(retryConfigList: go.Slice<go.Byte>=null);

    @:native("Error") function error(): (String);

}