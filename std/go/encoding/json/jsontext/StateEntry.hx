package go.encoding.json.jsontext;

@:go.Type({ name: "stateEntry", instanceName: "jsontext.stateEntry", imports: ["encoding/json/jsontext"] })
extern typedef StateEntry = haxe.extern.EitherType<go.UInt64, {
    @:native("DisableNamespace") function disableNamespace(): Void;
    @:native("Increment") function increment(): Void;
    @:native("Length") function length(): (go.Int64);
    @:native("NeedObjectName") function needObjectName(): (Bool);

}>