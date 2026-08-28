package go.database.sql;

/**
    NullString represents a string that may be null.
    NullString implements the [Scanner] interface so
    it can be used as a scan destination:
    
    	var s NullString
    	err := db.QueryRow("SELECT name FROM foo WHERE id=?", id).Scan(&s)
    	...
    	if s.Valid {
    	   // use s.String
    	} else {
    	   // NULL value
    	}
**/
@:structInit
@:go.Type({ name: "NullString", instanceName: "sql.NullString", imports: ["database/sql"] })
extern class NullString {

    @:native("String") var string: String;
    @:native("Valid") var valid: Bool;

    function new(string: String="", valid: Bool=false);

    /**
        Scan implements the [Scanner] interface.
    **/
    @:native("Scan") function scan(value: Dynamic): (go.Error);
    /**
        Value implements the [driver.Valuer] interface.
    **/
    @:native("Value") function value(): (go.Result<go.database.sql.driver.Value>);

}