package go.database.sql;

@:go.Type({ name: "decimal", instanceName: "sql.decimal", imports: ["database/sql"] })
extern typedef Decimal = {

    @:native("Compose") function compose(form: go.Byte, negative: Bool, coefficient: go.Slice<go.Byte>, exponent: go.Int32): (go.Error);
    @:go.Tuple("form", "negative", "coefficient", "exponent") @:native("Decompose") function decompose(buf: go.Slice<go.Byte>): (go.Tuple<{ form: go.Byte, negative: Bool, coefficient: go.Slice<go.Byte>, exponent: go.Int32 }>);

}