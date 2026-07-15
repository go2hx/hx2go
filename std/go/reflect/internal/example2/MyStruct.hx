package go.reflect.internal.example2;

@:structInit
@:go.Type({ name: "MyStruct", instanceName: "example2.MyStruct", imports: ["reflect/internal/example2"] })
extern class MyStruct {

    @:native("MyStructs") var myStructs: go.Slice<go.reflect.internal.example2.MyStruct>;
    @:native("MyStruct") var myStruct: go.Pointer<go.reflect.internal.example2.MyStruct>;

function new(myStructs: go.Slice<go.reflect.internal.example2.MyStruct>, myStruct: go.Pointer<go.reflect.internal.example2.MyStruct>);

}