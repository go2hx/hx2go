package go.regexp.syntax;

/**
    A Regexp is a node in a regular expression syntax tree.
**/
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

    function new(op: go.regexp.syntax.Op=cast 0, flags: go.regexp.syntax.Flags=cast 0, sub: go.Slice<go.Pointer<go.regexp.syntax.Regexp>>=null, sub0: go.GoArray<go.Pointer<go.regexp.syntax.Regexp>, 1>, rune: go.Slice<go.Rune>=null, rune0: go.GoArray<go.Rune, 2>, min: go.GoInt=0, max: go.GoInt=0, cap: go.GoInt=0, name: String="");

    /**
        CapNames walks the regexp to find the names of capturing groups.
    **/
    @:native("CapNames") function capNames(): (go.Slice<String>);
    /**
        Equal reports whether x and y have identical structure.
    **/
    @:native("Equal") function equal(y: go.Pointer<go.regexp.syntax.Regexp>): (Bool);
    /**
        MaxCap walks the regexp to find the maximum capture index.
    **/
    @:native("MaxCap") function maxCap(): (go.GoInt);
    /**
        Simplify returns a regexp equivalent to re but without counted repetitions
        and with various other simplifications, such as rewriting /(?:a+)+/ to /a+/.
        The resulting regexp will execute correctly but its string representation
        will not produce the same parse tree, because capturing parentheses
        may have been duplicated or removed. For example, the simplified form
        for /(x){1,2}/ is /(x)(x)?/ but both parentheses capture as $1.
        The returned regexp may share structure with or be the original.
    **/
    @:native("Simplify") function simplify(): (go.Pointer<go.regexp.syntax.Regexp>);
    @:native("String") function string(): (String);

}