package go.internal.coverage;

@:go.Type({ name: "slicereader", instanceName: "slicereader.slicereader", imports: ["internal/coverage/slicereader"] })
extern class Slicereader {

    @:native("NewReader") static function newReader(b: go.Slice<go.Byte>, readonly: Bool): go.Pointer<go.internal.coverage.slicereader.Reader>;

}