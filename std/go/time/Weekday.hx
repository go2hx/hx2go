package go.time;

/**
    A Weekday specifies a day of the week (Sunday = 0, ...).
**/
@:go.Type({ name: "Weekday", instanceName: "time.Weekday", imports: ["time"] })
extern typedef Weekday = haxe.extern.EitherType<go.GoInt, {
    /**
        String returns the English name of the day ("Sunday", "Monday", ...).
    **/
    @:native("String") function string(): (String);

}>