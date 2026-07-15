package go.internal.runtime;

@:go.Type({ name: "maps", instanceName: "maps.maps", imports: ["internal/runtime/maps"] })
extern class Maps {

    @:native("Use64BitHash") static var Use64BitHash: Bool;

    @:native("NewEmptyMap") static function newEmptyMap(): go.Pointer<go.internal.runtime.maps.Map>;
    @:native("NewMap") static function newMap(mt: go.Pointer<go.internal.abi.MapType>, hint: go.UIntPtr, m: go.Pointer<go.internal.runtime.maps.Map>, maxAlloc: go.UIntPtr): go.Pointer<go.internal.runtime.maps.Map>;

}