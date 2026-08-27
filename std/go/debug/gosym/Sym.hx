package go.debug.gosym;

@:structInit
@:go.Type({ name: "Sym", instanceName: "gosym.Sym", imports: ["debug/gosym"] })
extern class Sym {

    @:native("Value") var value: go.UInt64;
    @:native("Type") var type: go.Byte;
    @:native("Name") var name: String;
    @:native("GoType") var goType: go.UInt64;
    @:native("Func") var func: go.Pointer<go.debug.gosym.Func>;

    function new(value: go.UInt64=0, type: go.Byte=0, name: String="", goType: go.UInt64=0, func: go.Pointer<go.debug.gosym.Func>=null);

    @:native("BaseName") function baseName(): (String);
    @:native("PackageName") function packageName(): (String);
    @:native("ReceiverName") function receiverName(): (String);
    @:native("Static") function _static(): (Bool);

}