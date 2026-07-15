package go.database.sql.driver;

@:go.Type({ name: "NamedValueChecker", instanceName: "driver.NamedValueChecker", imports: ["database/sql/driver"] })
extern typedef NamedValueChecker = {

    @:native("CheckNamedValue") function checkNamedValue(p0: go.Pointer<go.database.sql.driver.NamedValue>): go.Error;

}