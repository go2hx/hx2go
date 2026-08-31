package go.database.sql.driver;

/**
    ValueConverter is the interface providing the ConvertValue method.
    
    Various implementations of ValueConverter are provided by the
    driver package to provide consistent implementations of conversions
    between drivers. The ValueConverters have several uses:
    
      - converting from the [Value] types as provided by the sql package
        into a database table's specific column type and making sure it
        fits, such as making sure a particular int64 fits in a
        table's uint16 column.
    
      - converting a value as given from the database into one of the
        driver [Value] types.
    
      - by the [database/sql] package, for converting from a driver's [Value] type
        to a user's type in a scan.
**/
@:go.Type({ name: "ValueConverter", instanceName: "driver.ValueConverter", imports: ["database/sql/driver"] })
extern typedef ValueConverter = {

    @:native("ConvertValue") function convertValue(v: Dynamic): (go.Result<go.database.sql.driver.Value>);

}