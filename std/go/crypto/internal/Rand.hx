package go.crypto.internal;

@:go.Type({ name: "rand", instanceName: "rand.rand", imports: ["crypto/internal/rand"] })
extern class Rand {

    @:native("Reader") static var Reader: go.io.Reader;

    @:native("CustomReader") static function customReader(r: go.io.Reader): go.io.Reader;
    @:native("IsDefaultReader") static function isDefaultReader(r: go.io.Reader): Bool;
    @:native("SetTestingReader") static function setTestingReader(r: go.io.Reader): Void;

}