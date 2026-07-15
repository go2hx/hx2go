package go.crypto.internal.sysrand.internal;

@:go.Type({ name: "seccomp", instanceName: "seccomp.seccomp", imports: ["crypto/internal/sysrand/internal/seccomp"] })
extern class Seccomp {

    @:native("DisableGetrandom") static function disableGetrandom(): go.Error;

}