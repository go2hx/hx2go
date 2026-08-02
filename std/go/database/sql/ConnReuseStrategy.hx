package go.database.sql;

@:go.Type({ name: "connReuseStrategy", instanceName: "sql.connReuseStrategy", imports: ["database/sql"] })
extern typedef ConnReuseStrategy = go.UInt8