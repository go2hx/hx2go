package go.syscall;

@:structInit
@:go.Type({ name: "GUID", instanceName: "syscall.GUID", imports: ["syscall"] })
extern class GUID {

    @:native("Data1") var data1: go.UInt32;
    @:native("Data2") var data2: go.UInt16;
    @:native("Data3") var data3: go.UInt16;
    @:native("Data4") var data4: go.GoArray<go.Byte, 8>;

    function new(data1: go.UInt32=0, data2: go.UInt16=0, data3: go.UInt16=0, data4: go.GoArray<go.Byte, 8>);

}