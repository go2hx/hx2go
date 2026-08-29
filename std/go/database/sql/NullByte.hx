package go.database.sql;

/**
    NullByte represents a byte that may be null.
    NullByte implements the [Scanner] interface so
    it can be used as a scan destination, similar to [NullString].
**/
@:structInit
@:go.Type({ name: "NullByte", instanceName: "sql.NullByte", imports: ["database/sql"] })
extern class NullByte {

    @:native("Byte") var byte: go.Byte;
    @:native("Valid") var valid: Bool;

    function new(byte: go.Byte=0, valid: Bool=false);

    /**
        Scan implements the [Scanner] interface.
    **/
    @:native("Scan") function scan(value: Dynamic): (go.Error);
    /**
        Value implements the [driver.Valuer] interface.
    **/
    @:native("Value") function value(): (go.Result<go.database.sql.driver.Value>);

}