package go.database.sql.driver;

@:go.Type({ name: "ColumnConverter", instanceName: "driver.ColumnConverter", imports: ["database/sql/driver"] })
extern typedef ColumnConverter = {

    @:native("ColumnConverter") function columnConverter(idx: go.GoInt): go.database.sql.driver.ValueConverter;

}