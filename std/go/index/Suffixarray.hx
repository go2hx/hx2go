package go.index;

@:go.Type({ name: "suffixarray", instanceName: "suffixarray.suffixarray", imports: ["index/suffixarray"] })
extern class Suffixarray {

    @:native("New") static function _new(data: go.Slice<go.Byte>): go.Pointer<go.index.suffixarray.Index>;

}