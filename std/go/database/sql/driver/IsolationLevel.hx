package go.database.sql.driver;

/**
    IsolationLevel is the transaction isolation level stored in [TxOptions].
    
    This type should be considered identical to [database/sql.IsolationLevel] along
    with any values defined on it.
**/
@:go.Type({ name: "IsolationLevel", instanceName: "driver.IsolationLevel", imports: ["database/sql/driver"] })
extern typedef IsolationLevel = go.GoInt