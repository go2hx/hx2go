package go.internal.runtime.maps;

@:structInit
@:go.Type({ name: "Map", instanceName: "maps.Map", imports: ["internal/runtime/maps"] })
extern class Map {

    @:native("Clear") function clear(typ: go.Pointer<go.internal.abi.MapType>): Void;
    @:native("Clone") function clone(typ: go.Pointer<go.internal.abi.MapType>): go.Pointer<go.internal.runtime.maps.Map>;
    @:native("Delete") function delete(typ: go.Pointer<go.internal.abi.MapType>, key: go.unsafe.Pointer): Void;
    @:go.Tuple("p0", "p1") @:native("Get") function get(typ: go.Pointer<go.internal.abi.MapType>, key: go.unsafe.Pointer): go.Tuple<{ p0: go.unsafe.Pointer, p1: Bool }>;
    @:native("Put") function put(typ: go.Pointer<go.internal.abi.MapType>, key: go.unsafe.Pointer, elem: go.unsafe.Pointer): Void;
    @:native("PutSlot") function putSlot(typ: go.Pointer<go.internal.abi.MapType>, key: go.unsafe.Pointer): go.unsafe.Pointer;
    @:native("Used") function used(): go.UInt64;

}