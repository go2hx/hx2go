package go.reflect.internal.example1;

@:structInit
@:go.Type({ name: "MyStruct", instanceName: "example1.MyStruct", imports: ["reflect/internal/example1"] })
extern class MyStruct {

    @:native("MyStructs") var myStructs: go.Slice<go.reflect.internal.example1.MyStruct>;
    @:native("MyStruct") var myStruct: go.Pointer<go.reflect.internal.example1.MyStruct>;

function new(myStructs: go.Slice<go.reflect.internal.example1.MyStruct>, myStruct: go.Pointer<go.reflect.internal.example1.MyStruct>);

}