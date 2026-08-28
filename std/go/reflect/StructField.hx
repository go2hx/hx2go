package go.reflect;

/**
    A StructField describes a single field in a struct.
**/
@:structInit
@:go.Type({ name: "StructField", instanceName: "reflect.StructField", imports: ["reflect"] })
extern class StructField {

    @:native("Name") var name: std.String;
    @:native("PkgPath") var pkgPath: std.String;
    @:native("Type") var type: go.reflect.Type;
    @:native("Tag") var tag: go.reflect.StructTag;
    @:native("Offset") var offset: go.UIntPtr;
    @:native("Index") var index: go.Slice<go.GoInt>;
    @:native("Anonymous") var anonymous: Bool;

    function new(name: std.String="", pkgPath: std.String="", type: go.reflect.Type=null, tag: go.reflect.StructTag=cast "", offset: go.UIntPtr=0, index: go.Slice<go.GoInt>=null, anonymous: Bool=false);

    /**
        IsExported reports whether the field is exported.
    **/
    @:native("IsExported") function isExported(): (Bool);

}