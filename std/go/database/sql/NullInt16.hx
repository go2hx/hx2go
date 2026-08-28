package go.database.sql;

/**
    NullInt16 represents an int16 that may be null.
    NullInt16 implements the [Scanner] interface so
    it can be used as a scan destination, similar to [NullString].
**/
@:structInit
@:go.Type({ name: "NullInt16", instanceName: "sql.NullInt16", imports: ["database/sql"] })
extern class NullInt16 {

    @:native("Int16") var int16: go.Int16;
    @:native("Valid") var valid: Bool;

    function new(int16: go.Int16=0, valid: Bool=false);

    /**
        Scan implements the [Scanner] interface.
    **/
    @:native("Scan") function scan(value: Dynamic): (go.Error);
    /**
        Value implements the [driver.Valuer] interface.
    **/
    @:native("Value") function value(): (go.Result<go.database.sql.driver.Value>);

}