package go.reflect;

@:structInit
@:go.Type({ name: "StructField", instanceName: "Reflect.StructField", imports: ["reflect"] })
extern class StructField {

    @:native("Name") var name: String;
    @:native("PkgPath") var pkgPath: String;
    @:native("Type") var type: go.reflect.Type;
    @:native("Tag") var tag: go.reflect.StructTag;
    @:native("Offset") var offset: go.UIntPtr;
    @:native("Index") var index: go.Slice<go.GoInt>;
    @:native("Anonymous") var anonymous: Bool;

    function new(name: String="", pkgPath: String="", type: go.reflect.Type=null, tag: go.reflect.StructTag=cast "", offset: go.UIntPtr=0, index: go.Slice<go.GoInt>=null, anonymous: Bool=false);

    @:native("IsExported") function isExported(): (Bool);

}