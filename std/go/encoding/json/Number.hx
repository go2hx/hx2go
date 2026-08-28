package go.encoding.json;

/**
    A Number represents a JSON number literal.
**/
@:go.Type({ name: "Number", instanceName: "json.Number", imports: ["encoding/json"] })
extern typedef Number = haxe.extern.EitherType<String, {
    /**
        Float64 returns the number as a float64.
    **/
    @:native("Float64") function float64(): (go.Result<Float>);
    /**
        Int64 returns the number as an int64.
    **/
    @:native("Int64") function int64(): (go.Result<go.Int64>);
    /**
        String returns the literal text of the number.
    **/
    @:native("String") function string(): (String);

}>