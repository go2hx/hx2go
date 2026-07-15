package go.database.sql;

@:structInit
@:go.Type({ name: "NullByte", instanceName: "sql.NullByte", imports: ["database/sql"] })
extern class NullByte {

    @:native("Byte") var byte: go.Byte;
    @:native("Valid") var valid: Bool;

function new(byte: go.Byte, valid: Bool);

    @:native("Scan") function scan(value: Dynamic): go.Error;
    @:native("Value") function value(): go.Result<go.database.sql.driver.Value>;

}