package go.database.sql;

@:go.Type({ name: "releaseConn", instanceName: "sql.releaseConn", imports: ["database/sql"] })
extern typedef ReleaseConn = (p0: go.Error) -> Void