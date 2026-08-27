package go.reflect;

@:structInit
@:go.Type({ name: "SliceHeader", instanceName: "Reflect.sliceHeader", imports: ["reflect"] })
extern class SliceHeader {

    @:native("Data") var data: go.UIntPtr;
    @:native("Len") var len: go.GoInt;
    @:native("Cap") var cap: go.GoInt;

    function new(data: go.UIntPtr=0, len: go.GoInt=0, cap: go.GoInt=0);

}