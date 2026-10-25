package go.encoding.json.jsontext;

@:structInit
@:go.Type({ name: "decoderState", instanceName: "jsontext.decoderState", imports: ["encoding/json/jsontext"] })
extern class DecoderState {

    @:native("Struct") var struct: Dynamic;
    @:native("StringCache") var stringCache: go.Pointer<go.GoArray<std.String, 256>>;
    @:native("Tokens") var tokens: go.encoding.json.jsontext.StateMachine;
    @:native("Names") var names: go.encoding.json.jsontext.ObjectNameStack;
    @:native("Namespaces") var namespaces: go.encoding.json.jsontext.ObjectNamespaceStack;
    @:native("Flags") var flags: Dynamic;
    @:native("CoderValues") var coderValues: Dynamic;
    @:native("ArshalValues") var arshalValues: Dynamic;
    @:native("Indent") var indent: std.String;
    @:native("IndentPrefix") var indentPrefix: std.String;
    @:native("ByteLimit") var byteLimit: go.Int64;
    @:native("DepthLimit") var depthLimit: go.GoInt;
    @:native("Marshalers") var marshalers: Dynamic;
    @:native("Unmarshalers") var unmarshalers: Dynamic;
    @:native("Format") var format: std.String;

    function new(struct: Dynamic, stringCache: go.Pointer<go.GoArray<std.String, 256>>=null);

    @:native("AppendStackPointer") function appendStackPointer(b: go.Slice<go.Byte>, where: go.GoInt): (go.Slice<go.Byte>);
    @:native("AtEOF") function atEOF(): (Bool);
    @:native("CheckEOF") function checkEOF(): (go.Error);
    @:native("CheckNextValue") function checkNextValue(last: Bool): (go.Error);
    @:native("CountNextDelimWhitespace") function countNextDelimWhitespace(): (go.GoInt);
    @:native("InitializeMultiline") function initializeMultiline(): Void;
    @:native("JSONOptions") function jSONOptions(p0: Dynamic): Void;
    @:native("Join") function join(srcs: haxe.Rest<Dynamic>): Void;
    @:native("PeekKind") function peekKind(): (go.encoding.json.jsontext.Kind);
    @:native("PreviousTokenOrValue") function previousTokenOrValue(): (go.Slice<go.Byte>);
    @:native("ReadToken") function readToken(): (go.Result<go.encoding.json.jsontext.Token>);
    @:native("ReadValue") function readValue(flags: go.Pointer<Dynamic>): (go.Result<go.encoding.json.jsontext.Value>);
    @:native("SkipUntil") function skipUntil(depth: go.GoInt, length: go.Int64): (go.Error);
    @:native("SkipValue") function skipValue(): (go.Error);
    @:native("SkipValueRemainder") function skipValueRemainder(): (go.Error);

}