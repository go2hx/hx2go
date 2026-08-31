package go.io.fs;

/**
    An FS provides access to a hierarchical file system.
    
    The FS interface is the minimum implementation required of the file system.
    A file system may implement additional interfaces,
    such as [ReadFileFS], to provide additional or optimized functionality.
    
    [testing/fstest.TestFS] may be used to test implementations of an FS for
    correctness.
**/
@:go.Type({ name: "FS", instanceName: "fs.FS", imports: ["io/fs"] })
extern typedef FS = {

    @:native("Open") function open(name: String): (go.Result<go.io.fs.File>);

}