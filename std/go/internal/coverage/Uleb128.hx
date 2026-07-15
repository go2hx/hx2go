package go.internal.coverage;

@:go.Type({ name: "uleb128", instanceName: "uleb128.uleb128", imports: ["internal/coverage/uleb128"] })
extern class Uleb128 {

    @:native("AppendUleb128") static function appendUleb128(b: go.Slice<go.Byte>, v: go.GoUInt): go.Slice<go.Byte>;

}