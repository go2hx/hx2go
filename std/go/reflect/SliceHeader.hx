package go.reflect;

@:structInit
@:go.Type({ name: "SliceHeader", instanceName: "reflect.SliceHeader", imports: ["reflect"] })
extern class SliceHeader {

    @:native("Data") var data: go.UIntPtr;
    @:native("Len") var len: go.GoInt;
    @:native("Cap") var cap: go.GoInt;

function new(data: go.UIntPtr, len: go.GoInt, cap: go.GoInt);

}