package go.go;

@:go.Type({ name: "version", instanceName: "version.version", imports: ["go/version"] })
extern class Version {

    @:native("Compare") static function compare(x: String, y: String): go.GoInt;
    @:native("IsValid") static function isValid(x: String): Bool;
    @:native("Lang") static function lang(x: String): String;

}