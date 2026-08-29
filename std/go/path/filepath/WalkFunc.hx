package go.path.filepath;

/**
    WalkFunc is the type of the function called by [Walk] to visit each
    file or directory.
    
    The path argument contains the argument to Walk as a prefix.
    That is, if Walk is called with root argument "dir" and finds a file
    named "a" in that directory, the walk function will be called with
    argument "dir/a".
    
    The directory and file are joined with Join, which may clean the
    directory name: if Walk is called with the root argument "x/../dir"
    and finds a file named "a" in that directory, the walk function will
    be called with argument "dir/a", not "x/../dir/a".
    
    The info argument is the fs.FileInfo for the named path.
    
    The error result returned by the function controls how Walk continues.
    If the function returns the special value [SkipDir], Walk skips the
    current directory (path if info.IsDir() is true, otherwise path's
    parent directory). If the function returns the special value [SkipAll],
    Walk skips all remaining files and directories. Otherwise, if the function
    returns a non-nil error, Walk stops entirely and returns that error.
    
    The err argument reports an error related to path, signaling that Walk
    will not walk into that directory. The function can decide how to
    handle that error; as described earlier, returning the error will
    cause Walk to stop walking the entire tree.
    
    Walk calls the function with a non-nil err argument in two cases.
    
    First, if an [os.Lstat] on the root directory or any directory or file
    in the tree fails, Walk calls the function with path set to that
    directory or file's path, info set to nil, and err set to the error
    from os.Lstat.
    
    Second, if a directory's Readdirnames method fails, Walk calls the
    function with path set to the directory's path, info, set to an
    [fs.FileInfo] describing the directory, and err set to the error from
    Readdirnames.
**/
@:go.Type({ name: "WalkFunc", instanceName: "filepath.WalkFunc", imports: ["path/filepath"] })
extern class WalkFunc {

}