package go.debug.gosym;

@:structInit
@:go.Type({ name: "Func", instanceName: "gosym.Func", imports: ["debug/gosym"] })
extern class Func {

    @:native("Entry") var entry: go.UInt64;
    @:native("Sym") var sym: go.Pointer<go.debug.gosym.Sym>;
    @:native("End") var end: go.UInt64;
    @:native("Params") var params: go.Slice<go.Pointer<go.debug.gosym.Sym>>;
    @:native("Locals") var locals: go.Slice<go.Pointer<go.debug.gosym.Sym>>;
    @:native("FrameSize") var frameSize: go.GoInt;
    @:native("LineTable") var lineTable: go.Pointer<go.debug.gosym.LineTable>;
    @:native("Obj") var obj: go.Pointer<go.debug.gosym.Obj>;
    @:native("Value") var value: go.UInt64;
    @:native("Type") var type: go.Byte;
    @:native("Name") var name: String;
    @:native("GoType") var goType: go.UInt64;
    @:native("Func") var func: go.Pointer<go.debug.gosym.Func>;

    function new(entry: go.UInt64=0, sym: go.Pointer<go.debug.gosym.Sym>=null, end: go.UInt64=0, params: go.Slice<go.Pointer<go.debug.gosym.Sym>>=null, locals: go.Slice<go.Pointer<go.debug.gosym.Sym>>=null, frameSize: go.GoInt=0, lineTable: go.Pointer<go.debug.gosym.LineTable>=null, obj: go.Pointer<go.debug.gosym.Obj>=null);

    @:native("BaseName") function baseName(): (String);
    @:native("PackageName") function packageName(): (String);
    @:native("ReceiverName") function receiverName(): (String);
    @:native("Static") function _static(): (Bool);

}