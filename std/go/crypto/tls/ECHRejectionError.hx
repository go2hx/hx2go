package go.crypto.tls;

@:structInit
@:go.Type({ name: "ECHRejectionError", instanceName: "tls.ECHRejectionError", imports: ["crypto/tls"] })
extern class ECHRejectionError {

    @:native("RetryConfigList") var retryConfigList: go.Slice<go.Byte>;

function new(retryConfigList: go.Slice<go.Byte>);

    @:native("Error") function error(): String;

}