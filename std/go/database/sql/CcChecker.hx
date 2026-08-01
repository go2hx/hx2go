package go.database.sql;

@:structInit
@:go.Type({ name: "ccChecker", instanceName: "sql.ccChecker", imports: ["database/sql"] })
extern class CcChecker {

    @:native("CheckNamedValue") function checkNamedValue(nv: go.Pointer<go.database.sql.driver.NamedValue>): (go.Error);

}