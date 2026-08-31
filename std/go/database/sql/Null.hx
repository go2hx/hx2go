package go.database.sql;

/**
    Null represents a value that may be null.
    Null implements the [Scanner] interface so
    it can be used as a scan destination:
    
    	var s Null[string]
    	err := db.QueryRow("SELECT name FROM foo WHERE id=?", id).Scan(&s)
    	...
    	if s.Valid {
    	   // use s.V
    	} else {
    	   // NULL value
    	}
    
    T should be one of the types accepted by [driver.Value].
**/
@:structInit
@:go.Type({ name: "Null", instanceName: "sql.Null", imports: ["database/sql"] })
extern class Null<T: Dynamic> {

    @:native("V") var V: T;
    @:native("Valid") var valid: Bool;

    function new(V: T=null, valid: Bool=false);

    @:native("Scan") function scan(value: Dynamic): (go.Error);
    @:native("Value") function value(): (go.Result<go.database.sql.driver.Value>);

}