package go.internal.runtime.maps;

@:structInit
@:go.Type({ name: "Iter", instanceName: "maps.Iter", imports: ["internal/runtime/maps"] })
extern class Iter {

    @:native("Elem") function elem(): go.unsafe.Pointer;
    @:native("Init") function init(typ: go.Pointer<go.internal.abi.MapType>, m: go.Pointer<go.internal.runtime.maps.Map>): Void;
    @:native("Initialized") function initialized(): Bool;
    @:native("Key") function key(): go.unsafe.Pointer;
    @:native("Map") function map(): go.Pointer<go.internal.runtime.maps.Map>;
    @:native("Next") function next(): Void;

}