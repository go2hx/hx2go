package go.log.slog;

@:structInit
@:go.Type({ name: "Record", instanceName: "slog.Record", imports: ["log/slog"] })
extern class Record {

    @:native("Time") var time: go.time.Time;
    @:native("Message") var message: String;
    @:native("Level") var level: go.log.slog.Level;
    @:native("PC") var PC: go.UIntPtr;

function new(time: go.time.Time, message: String, level: go.log.slog.Level, PC: go.UIntPtr);

    @:native("Add") function add(args: haxe.Rest<Dynamic>): Void;
    @:native("AddAttrs") function addAttrs(attrs: haxe.Rest<go.log.slog.Attr>): Void;
    @:native("Attrs") function attrs(f: (p0: go.log.slog.Attr) -> Bool): Void;
    @:native("Clone") function clone(): go.log.slog.Record;
    @:native("NumAttrs") function numAttrs(): go.GoInt;
    @:native("Source") function source(): go.Pointer<go.log.slog.Source>;

}