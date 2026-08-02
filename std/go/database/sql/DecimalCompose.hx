package go.database.sql;

@:go.Type({ name: "decimalCompose", instanceName: "sql.decimalCompose", imports: ["database/sql"] })
extern typedef DecimalCompose = {

    @:native("Compose") function compose(form: go.Byte, negative: Bool, coefficient: go.Slice<go.Byte>, exponent: go.Int32): (go.Error);

}