package go.encoding.json;

@:go.Type({ name: "Number", instanceName: "json.Number", imports: ["encoding/json"] })
extern typedef Number = haxe.extern.EitherType<String, {
    @:native("Float64") function float64(): (go.Result<Float>);
    @:native("Int64") function int64(): (go.Result<go.Int64>);
    @:native("String") function string(): (String);

}>