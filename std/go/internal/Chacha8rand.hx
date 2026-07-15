package go.internal;

@:go.Type({ name: "chacha8rand", instanceName: "chacha8rand.chacha8rand", imports: ["internal/chacha8rand"] })
extern class Chacha8rand {

    @:native("Marshal") static function marshal(s: go.Pointer<go.internal.chacha8rand.State>): go.Slice<go.Byte>;
    @:native("Unmarshal") static function unmarshal(s: go.Pointer<go.internal.chacha8rand.State>, data: go.Slice<go.Byte>): go.Error;

}