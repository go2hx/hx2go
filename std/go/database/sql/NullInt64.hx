package go.database.sql;

/**
    NullInt64 represents an int64 that may be null.
    NullInt64 implements the [Scanner] interface so
    it can be used as a scan destination, similar to [NullString].
**/
@:structInit
@:go.Type({ name: "NullInt64", instanceName: "sql.NullInt64", imports: ["database/sql"] })
extern class NullInt64 {

    @:native("Int64") var int64: go.Int64;
    @:native("Valid") var valid: Bool;

    function new(int64: go.Int64=0, valid: Bool=false);

    /**
        Scan implements the [Scanner] interface.
    **/
    @:native("Scan") function scan(value: Dynamic): (go.Error);
    /**
        Value implements the [driver.Valuer] interface.
    **/
    @:native("Value") function value(): (go.Result<go.database.sql.driver.Value>);

}