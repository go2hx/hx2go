package go.internal;

@:go.Type({ name: "reflectlite", instanceName: "reflectlite.reflectlite", imports: ["internal/reflectlite"] })
extern class Reflectlite {

    @:native("Interface") static var Interface: go.internal.abi.Kind;
    @:native("Ptr") static var Ptr: go.internal.abi.Kind;
    @:native("Slice") static var Slice: go.internal.abi.Kind;
    @:native("String") static var String: go.internal.abi.Kind;
    @:native("Struct") static var Struct: go.internal.abi.Kind;

    @:native("Swapper") static function swapper(slice: Dynamic): (i: go.GoInt, j: go.GoInt) -> Void;
    @:native("TypeOf") static function typeOf(i: Dynamic): go.internal.reflectlite.Type;
    @:native("ValueOf") static function valueOf(i: Dynamic): go.internal.reflectlite.Value;

}