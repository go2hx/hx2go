package go.internal.reflectlite;

@:structInit
@:go.Type({ name: "Value", instanceName: "reflectlite.Value", imports: ["internal/reflectlite"] })
extern class Value {

    @:native("CanSet") function canSet(): Bool;
    @:native("Elem") function elem(): go.internal.reflectlite.Value;
    @:native("IsNil") function isNil(): Bool;
    @:native("IsValid") function isValid(): Bool;
    @:native("Kind") function kind(): go.internal.reflectlite.Kind;
    @:native("Len") function len(): go.GoInt;
    @:native("Set") function set(x: go.internal.reflectlite.Value): Void;
    @:native("Type") function type(): go.internal.reflectlite.Type;

}