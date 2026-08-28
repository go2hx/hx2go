package go.io.fs;

/**
    WalkDirFunc is the type of the function called by [WalkDir] to visit
    each file or directory.
    
    The path argument contains the argument to [WalkDir] as a prefix.
    That is, if WalkDir is called with root argument "dir" and finds a file
    named "a" in that directory, the walk function will be called with
    argument "dir/a".
    
    The d argument is the [DirEntry] for the named path.
    
    The error result returned by the function controls how [WalkDir]
    continues. If the function returns the special value [SkipDir], WalkDir
    skips the current directory (path if d.IsDir() is true, otherwise
    path's parent directory). If the function returns the special value
    [SkipAll], WalkDir skips all remaining files and directories. Otherwise,
    if the function returns a non-nil error, WalkDir stops entirely and
    returns that error.
    
    The err argument reports an error related to path, signaling that
    [WalkDir] will not walk into that directory. The function can decide how
    to handle that error; as described earlier, returning the error will
    cause WalkDir to stop walking the entire tree.
    
    [WalkDir] calls the function with a non-nil err argument in two cases.
    
    First, if the initial [Stat] on the root directory fails, WalkDir
    calls the function with path set to root, d set to nil, and err set to
    the error from [fs.Stat].
    
    Second, if a directory's ReadDir method (see [ReadDirFile]) fails, WalkDir calls the
    function with path set to the directory's path, d set to an
    [DirEntry] describing the directory, and err set to the error from
    ReadDir. In this second case, the function is called twice with the
    path of the directory: the first call is before the directory read is
    attempted and has err set to nil, giving the function a chance to
    return [SkipDir] or [SkipAll] and avoid the ReadDir entirely. The second call
    is after a failed ReadDir and reports the error from ReadDir.
    (If ReadDir succeeds, there is no second call.)
    
    The differences between WalkDirFunc compared to [path/filepath.WalkFunc] are:
    
      - The second argument has type [DirEntry] instead of [FileInfo].
      - The function is called before reading a directory, to allow [SkipDir]
        or [SkipAll] to bypass the directory read entirely or skip all remaining
        files and directories respectively.
      - If a directory read fails, the function is called a second time
        for that directory to report the error.
**/
@:go.Type({ name: "WalkDirFunc", instanceName: "fs.WalkDirFunc", imports: ["io/fs"] })
extern class WalkDirFunc {

}