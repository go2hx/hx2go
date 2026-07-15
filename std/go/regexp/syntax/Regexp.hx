package go.regexp.syntax;

@:structInit
@:go.Type({ name: "Regexp", instanceName: "syntax.Regexp", imports: ["regexp/syntax"] })
extern class Regexp {

    @:native("Op") var op: go.regexp.syntax.Op;
    @:native("Flags") var flags: go.regexp.syntax.Flags;
    @:native("Sub") var sub: go.Slice<go.Pointer<go.regexp.syntax.Regexp>>;
    @:native("Sub0") var sub0: go.GoArray<go.Pointer<go.regexp.syntax.Regexp>, 1>;
    @:native("Rune") var rune: go.Slice<go.Rune>;
    @:native("Rune0") var rune0: go.GoArray<go.Rune, 2>;
    @:native("Min") var min: go.GoInt;
    @:native("Max") var max: go.GoInt;
    @:native("Cap") var cap: go.GoInt;
    @:native("Name") var name: String;

function new(op: go.regexp.syntax.Op, flags: go.regexp.syntax.Flags, sub: go.Slice<go.Pointer<go.regexp.syntax.Regexp>>, sub0: go.GoArray<go.Pointer<go.regexp.syntax.Regexp>, 1>, rune: go.Slice<go.Rune>, rune0: go.GoArray<go.Rune, 2>, min: go.GoInt, max: go.GoInt, cap: go.GoInt, name: String);

    @:native("CapNames") function capNames(): go.Slice<String>;
    @:native("Equal") function equal(y: go.Pointer<go.regexp.syntax.Regexp>): Bool;
    @:native("MaxCap") function maxCap(): go.GoInt;
    @:native("Simplify") function simplify(): go.Pointer<go.regexp.syntax.Regexp>;
    @:native("String") function string(): String;

}