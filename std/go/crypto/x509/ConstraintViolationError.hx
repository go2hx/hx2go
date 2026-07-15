package go.crypto.x509;

@:structInit
@:go.Type({ name: "ConstraintViolationError", instanceName: "x509.ConstraintViolationError", imports: ["crypto/x509"] })
extern class ConstraintViolationError {

    @:native("Error") function error(): String;

}