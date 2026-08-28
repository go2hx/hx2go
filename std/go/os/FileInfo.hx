package go.os;

/**
    A FileInfo describes a file and is returned by [Stat] and [Lstat].
**/
@:go.Type({ name: "FileInfo", instanceName: "os.FileInfo", imports: ["os"] })
extern typedef FileInfo = go.io.fs.FileInfo