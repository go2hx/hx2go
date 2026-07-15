package go.reflect;

@:structInit
@:go.Type({ name: "StringHeader", instanceName: "reflect.StringHeader", imports: ["reflect"] })
extern class StringHeader {

    @:native("Data") var data: go.UIntPtr;
    @:native("Len") var len: go.GoInt;

function new(data: go.UIntPtr, len: go.GoInt);

}