package go.compress.flate;

@:structInit
@:go.Type({ name: "tokens", instanceName: "flate.tokens", imports: ["compress/flate"] })
extern class Tokens {

    @:native("AddEOB") function addEOB(): Void;
    @:native("AddLiteral") function addLiteral(lit: go.Byte): Void;
    @:native("AddMatch") function addMatch(xlength: go.UInt32, xoffset: go.UInt32): Void;
    @:native("AddMatchLong") function addMatchLong(xlength: go.Int32, xoffset: go.UInt32): Void;
    @:native("EstimatedBits") function estimatedBits(): (go.GoInt);
    @:native("Reset") function reset(): Void;
    @:native("Slice") function slice(): (go.Slice<go.compress.flate.Token>);

}