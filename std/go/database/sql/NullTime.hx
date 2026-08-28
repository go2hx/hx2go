package go.database.sql;

/**
    NullTime represents a [time.Time] that may be null.
    NullTime implements the [Scanner] interface so
    it can be used as a scan destination, similar to [NullString].
**/
@:structInit
@:go.Type({ name: "NullTime", instanceName: "sql.NullTime", imports: ["database/sql"] })
extern class NullTime {

    @:native("Time") var time: go.time.Time;
    @:native("Valid") var valid: Bool;

    function new(time: go.time.Time, valid: Bool=false);

    /**
        Scan implements the [Scanner] interface.
    **/
    @:native("Scan") function scan(value: Dynamic): (go.Error);
    /**
        Value implements the [driver.Valuer] interface.
    **/
    @:native("Value") function value(): (go.Result<go.database.sql.driver.Value>);

}