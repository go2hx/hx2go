package go.database.sql.driver;

@:go.Type({ name: "decimalDecompose", instanceName: "driver.decimalDecompose", imports: ["database/sql/driver"] })
extern typedef DecimalDecompose = {

    @:go.Tuple("form", "negative", "coefficient", "exponent") @:native("Decompose") function decompose(buf: go.Slice<go.Byte>): (go.Tuple<{ form: go.Byte, negative: Bool, coefficient: go.Slice<go.Byte>, exponent: go.Int32 }>);

}