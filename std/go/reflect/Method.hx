package go.reflect;

@:structInit
@:go.Type({ name: "Method", instanceName: "reflect.Method", imports: ["reflect"] })
extern class Method {

    @:native("Name") var name: String;
    @:native("PkgPath") var pkgPath: String;
    @:native("Type") var type: go.reflect.Type;
    @:native("Func") var func: go.reflect.Value;
    @:native("Index") var index: go.GoInt;

    function new(name: String, pkgPath: String, type: go.reflect.Type, func: go.reflect.Value, index: go.GoInt);

    @:native("IsExported") function isExported(): (Bool);

}