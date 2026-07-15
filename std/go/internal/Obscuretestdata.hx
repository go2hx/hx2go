package go.internal;

@:go.Type({ name: "obscuretestdata", instanceName: "obscuretestdata.obscuretestdata", imports: ["internal/obscuretestdata"] })
extern class Obscuretestdata {

    @:native("DecodeToTempFile") static function decodeToTempFile(name: String): go.Result<String>;
    @:native("ReadFile") static function readFile(name: String): go.Result<go.Slice<go.Byte>>;
    @:native("Rot13") static function rot13(data: go.Slice<go.Byte>): go.Slice<go.Byte>;

}