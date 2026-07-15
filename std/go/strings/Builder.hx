package go.strings;

@:structInit
@:go.Type({ name: "Builder", instanceName: "strings.Builder", imports: ["strings"] })
extern class Builder {

    @:native("Cap") function cap(): go.GoInt;
    @:native("Grow") function grow(n: go.GoInt): Void;
    @:native("Len") function len(): go.GoInt;
    @:native("Reset") function reset(): Void;
    @:native("String") function string(): String;
    @:native("Write") function write(p: go.Slice<go.Byte>): go.Result<go.GoInt>;
    @:native("WriteByte") function writeByte(c: go.Byte): go.Error;
    @:native("WriteRune") function writeRune(r: go.Rune): go.Result<go.GoInt>;
    @:native("WriteString") function writeString(s: String): go.Result<go.GoInt>;

}