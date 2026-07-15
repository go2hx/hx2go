package go.internal.reflectlite;

@:go.Type({ name: "Type", instanceName: "reflectlite.Type", imports: ["internal/reflectlite"] })
extern typedef Type = {

    @:native("AssignableTo") function assignableTo(u: go.internal.reflectlite.Type): Bool;
    @:native("Comparable") function comparable(): Bool;
    @:native("Elem") function elem(): go.internal.reflectlite.Type;
    @:native("Implements") function _implements(u: go.internal.reflectlite.Type): Bool;
    @:native("Kind") function kind(): go.internal.reflectlite.Kind;
    @:native("Name") function name(): String;
    @:native("PkgPath") function pkgPath(): String;
    @:native("Size") function size(): go.UIntPtr;
    @:native("String") function string(): String;

}