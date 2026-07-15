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

function new(entry: go.UInt64, sym: go.Pointer<go.debug.gosym.Sym>, end: go.UInt64, params: go.Slice<go.Pointer<go.debug.gosym.Sym>>, locals: go.Slice<go.Pointer<go.debug.gosym.Sym>>, frameSize: go.GoInt, lineTable: go.Pointer<go.debug.gosym.LineTable>, obj: go.Pointer<go.debug.gosym.Obj>);

    @:native("BaseName") function baseName(): String;
    @:native("PackageName") function packageName(): String;
    @:native("ReceiverName") function receiverName(): String;
    @:native("Static") function _static(): Bool;

}