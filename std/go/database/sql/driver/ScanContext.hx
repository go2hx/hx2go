package go.database.sql.driver;

/**
    ScanContext carries state related to the current query
    through a [RowsColumnScanner.ScanColumn] function to [database/sql.ConvertAssign].
**/
@:structInit
@:go.Type({ name: "ScanContext", instanceName: "driver.ScanContext", imports: ["database/sql/driver"] })
extern class ScanContext {

}