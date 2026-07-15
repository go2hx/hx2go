package go.database.sql;

@:structInit
@:go.Type({ name: "NullTime", instanceName: "sql.NullTime", imports: ["database/sql"] })
extern class NullTime {

    @:native("Time") var time: go.time.Time;
    @:native("Valid") var valid: Bool;

function new(time: go.time.Time, valid: Bool);

    @:native("Scan") function scan(value: Dynamic): go.Error;
    @:native("Value") function value(): go.Result<go.database.sql.driver.Value>;

}