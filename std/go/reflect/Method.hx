package go.reflect;

/**
    Method represents a single method.
**/
@:structInit
@:go.Type({ name: "Method", instanceName: "reflect.Method", imports: ["reflect"] })
extern class Method {

    @:native("Name") var name: std.String;
    @:native("PkgPath") var pkgPath: std.String;
    @:native("Type") var type: go.reflect.Type;
    @:native("Func") var func: go.reflect.Value;
    @:native("Index") var index: go.GoInt;

    function new(name: std.String="", pkgPath: std.String="", type: go.reflect.Type=null, func: go.reflect.Value, index: go.GoInt=0);

    /**
        IsExported reports whether the method is exported.
    **/
    @:native("IsExported") function isExported(): (Bool);

}