package go.os;

/**
    PathError records an error and the operation and file path that caused it.
**/
@:go.Type({ name: "PathError", instanceName: "os.PathError", imports: ["os"] })
extern typedef PathError = go.io.fs.PathError