package go.database.sql;

@:go.Type({ name: "driver", instanceName: "driver.driver", imports: ["database/sql/driver"] })
extern class Driver {

    @:native("IsScanValue") static function isScanValue(v: Dynamic): Bool;
    @:native("IsValue") static function isValue(v: Dynamic): Bool;

}