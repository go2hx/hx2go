package go.time;

@:go.Type({ name: "Month", instanceName: "time.Month", imports: ["time"] })
extern typedef Month = haxe.extern.EitherType<go.GoInt, {
    @:native("String") function string(): (String);

}>