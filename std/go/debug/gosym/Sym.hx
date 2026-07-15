package go.debug.gosym;

@:structInit
@:go.Type({ name: "Sym", instanceName: "gosym.Sym", imports: ["debug/gosym"] })
extern class Sym {

    @:native("Value") var value: go.UInt64;
    @:native("Type") var type: go.Byte;
    @:native("Name") var name: String;
    @:native("GoType") var goType: go.UInt64;
    @:native("Func") var func: go.Pointer<go.debug.gosym.Func>;

function new(value: go.UInt64, type: go.Byte, name: String, goType: go.UInt64, func: go.Pointer<go.debug.gosym.Func>);

    @:native("BaseName") function baseName(): String;
    @:native("PackageName") function packageName(): String;
    @:native("ReceiverName") function receiverName(): String;
    @:native("Static") function _static(): Bool;

}