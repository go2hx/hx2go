package go.database.sql;

/**
    NullBool represents a bool that may be null.
    NullBool implements the [Scanner] interface so
    it can be used as a scan destination, similar to [NullString].
**/
@:structInit
@:go.Type({ name: "NullBool", instanceName: "sql.NullBool", imports: ["database/sql"] })
extern class NullBool {

    @:native("Bool") var bool: Bool;
    @:native("Valid") var valid: Bool;

    function new(bool: Bool=false, valid: Bool=false);

    /**
        Scan implements the [Scanner] interface.
    **/
    @:native("Scan") function scan(value: Dynamic): (go.Error);
    /**
        Value implements the [driver.Valuer] interface.
    **/
    @:native("Value") function value(): (go.Result<go.database.sql.driver.Value>);

}