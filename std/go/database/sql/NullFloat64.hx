package go.database.sql;

/**
    NullFloat64 represents a float64 that may be null.
    NullFloat64 implements the [Scanner] interface so
    it can be used as a scan destination, similar to [NullString].
**/
@:structInit
@:go.Type({ name: "NullFloat64", instanceName: "sql.NullFloat64", imports: ["database/sql"] })
extern class NullFloat64 {

    @:native("Float64") var float64: Float;
    @:native("Valid") var valid: Bool;

    function new(float64: Float=0.0, valid: Bool=false);

    /**
        Scan implements the [Scanner] interface.
    **/
    @:native("Scan") function scan(value: Dynamic): (go.Error);
    /**
        Value implements the [driver.Valuer] interface.
    **/
    @:native("Value") function value(): (go.Result<go.database.sql.driver.Value>);

}