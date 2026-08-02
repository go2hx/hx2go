package go.time;

@:go.Type({ name: "Weekday", instanceName: "time.Weekday", imports: ["time"] })
extern typedef Weekday = haxe.extern.EitherType<go.GoInt, {
    @:native("String") function string(): (String);

}>