package go.database.sql;

/**
    Out may be used to retrieve OUTPUT value parameters from stored procedures.
    
    Not all drivers and databases support OUTPUT value parameters.
    
    Example usage:
    
    	var outArg string
    	_, err := db.ExecContext(ctx, "ProcName", sql.Named("Arg1", sql.Out{Dest: &outArg}))
**/
@:structInit
@:go.Type({ name: "Out", instanceName: "sql.Out", imports: ["database/sql"] })
extern class Out {

    @:native("Dest") var dest: Dynamic;
    @:native("In") var _in: Bool;

    function new(dest: Dynamic=null, _in: Bool=false);

}