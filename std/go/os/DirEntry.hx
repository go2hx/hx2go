package go.os;

/**
    A DirEntry is an entry read from a directory
    (using the [ReadDir] function or a [File.ReadDir] method).
**/
@:go.Type({ name: "DirEntry", instanceName: "os.DirEntry", imports: ["os"] })
extern typedef DirEntry = go.io.fs.DirEntry