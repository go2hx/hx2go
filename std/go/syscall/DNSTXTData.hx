package go.syscall;

@:structInit
@:go.Type({ name: "DNSTXTData", instanceName: "syscall.DNSTXTData", imports: ["syscall"] })
extern class DNSTXTData {

    @:native("StringCount") var stringCount: go.UInt16;
    @:native("StringArray") var stringArray: go.GoArray<go.Pointer<go.UInt16>, 1>;

    function new(stringCount: go.UInt16=0, stringArray: go.GoArray<go.Pointer<go.UInt16>, 1>);

}