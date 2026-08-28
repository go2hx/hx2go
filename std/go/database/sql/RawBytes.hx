package go.database.sql;

/**
    RawBytes is a byte slice that holds a reference to memory owned by
    the database itself. After a [Rows.Scan] into a RawBytes, the slice is only
    valid until the next call to [Rows.Next], [Rows.Scan], or [Rows.Close].
**/
@:go.Type({ name: "RawBytes", instanceName: "sql.RawBytes", imports: ["database/sql"] })
extern class RawBytes {

}