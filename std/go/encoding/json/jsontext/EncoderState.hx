package go.encoding.json.jsontext;

@:structInit
@:go.Type({ name: "encoderState", instanceName: "jsontext.encoderState", imports: ["encoding/json/jsontext"] })
extern class EncoderState {

    @:native("Struct") var struct: Dynamic;
    @:native("SeenPointers") var seenPointers: go.Map<Dynamic, Dynamic>;
    @:native("Tokens") var tokens: go.encoding.json.jsontext.StateMachine;
    @:native("Names") var names: go.encoding.json.jsontext.ObjectNameStack;
    @:native("Namespaces") var namespaces: go.encoding.json.jsontext.ObjectNamespaceStack;
    @:native("Buf") var buf: go.Slice<go.Byte>;
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

    function new(struct: Dynamic, seenPointers: go.Map<Dynamic, Dynamic>=null);

    @:native("AppendIndent") function appendIndent(b: go.Slice<go.Byte>, n: go.GoInt): (go.Slice<go.Byte>);
    @:native("AppendRaw") function appendRaw(k: go.encoding.json.jsontext.Kind, safeASCII: Bool, appendFn: (p0: go.Slice<go.Byte>) -> (go.Result<go.Slice<go.Byte>>)): (go.Error);
    @:native("AppendStackPointer") function appendStackPointer(b: go.Slice<go.Byte>, where: go.GoInt): (go.Slice<go.Byte>);
    @:native("CountNextDelimWhitespace") function countNextDelimWhitespace(): (go.GoInt);
    @:native("Flush") function flush(): (go.Error);
    @:native("InitializeMultiline") function initializeMultiline(): Void;
    @:native("JSONOptions") function jSONOptions(p0: Dynamic): Void;
    @:native("Join") function join(srcs: haxe.Rest<Dynamic>): Void;
    @:native("NeedFlush") function needFlush(): (Bool);
    @:native("UnwriteEmptyObjectMember") function unwriteEmptyObjectMember(prevName: go.Pointer<std.String>): (Bool);
    @:native("UnwriteOnlyObjectMemberName") function unwriteOnlyObjectMemberName(): (std.String);
    @:native("WriteToken") function writeToken(t: go.encoding.json.jsontext.Token): (go.Error);
    @:native("WriteValue") function writeValue(v: go.encoding.json.jsontext.Value): (go.Error);

}