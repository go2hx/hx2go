package go.encoding.json.jsontext;

@:structInit
@:go.Type({ name: "stateMachine", instanceName: "jsontext.stateMachine", imports: ["encoding/json/jsontext"] })
extern class StateMachine {

    @:native("Stack") var stack: go.Slice<go.encoding.json.jsontext.StateEntry>;
    @:native("Last") var last: go.encoding.json.jsontext.StateEntry;

    function new(stack: go.Slice<go.encoding.json.jsontext.StateEntry>=null, last: go.encoding.json.jsontext.StateEntry=cast 0);

    @:native("Depth") function depth(): (go.GoInt);
    @:go.Tuple("p0", "p1") @:native("DepthLength") function depthLength(): (go.Tuple<{ p0: go.GoInt, p1: go.Int64 }>);
    @:native("InvalidateDisabledNamespaces") function invalidateDisabledNamespaces(): Void;
    @:native("MayAppendDelim") function mayAppendDelim(b: go.Slice<go.Byte>, next: go.encoding.json.jsontext.Kind): (go.Slice<go.Byte>);
    @:native("NeedIndent") function needIndent(next: go.encoding.json.jsontext.Kind): (go.GoInt);

}