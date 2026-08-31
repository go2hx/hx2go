package go.crypto.x509;

/**
    ConstraintViolationError results when a requested usage is not permitted by
    a certificate. For example: checking a signature when the public key isn't a
    certificate signing key.
**/
@:structInit
@:go.Type({ name: "ConstraintViolationError", instanceName: "x509.ConstraintViolationError", imports: ["crypto/x509"] })
extern class ConstraintViolationError {

    @:native("Error") function error(): (String);

}