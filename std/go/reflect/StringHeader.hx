package go.reflect;

@:structInit
@:go.Type({ name: "StringHeader", instanceName: "Reflect.stringHeader", imports: ["reflect"] })
extern class StringHeader {

    @:native("Data") var data: go.UIntPtr;
    @:native("Len") var len: go.GoInt;

    function new(data: go.UIntPtr=0, len: go.GoInt=0);

}