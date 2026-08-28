package go.database.sql;

/**
    NullInt32 represents an int32 that may be null.
    NullInt32 implements the [Scanner] interface so
    it can be used as a scan destination, similar to [NullString].
**/
@:structInit
@:go.Type({ name: "NullInt32", instanceName: "sql.NullInt32", imports: ["database/sql"] })
extern class NullInt32 {

    @:native("Int32") var int32: go.Int32;
    @:native("Valid") var valid: Bool;

    function new(int32: go.Int32=0, valid: Bool=false);

    /**
        Scan implements the [Scanner] interface.
    **/
    @:native("Scan") function scan(value: Dynamic): (go.Error);
    /**
        Value implements the [driver.Valuer] interface.
    **/
    @:native("Value") function value(): (go.Result<go.database.sql.driver.Value>);

}