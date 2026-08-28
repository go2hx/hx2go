package go.time;

/**
    A Month specifies a month of the year (January = 1, ...).
**/
@:go.Type({ name: "Month", instanceName: "time.Month", imports: ["time"] })
extern typedef Month = haxe.extern.EitherType<go.GoInt, {
    /**
        String returns the English name of the month ("January", "February", ...).
    **/
    @:native("String") function string(): (String);

}>