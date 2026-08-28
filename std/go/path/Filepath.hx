package go.path;

/**
    Package filepath implements utility routines for manipulating filename paths
    in a way compatible with the target operating system-defined file paths.
    
    The filepath package uses either forward slashes or backslashes,
    depending on the operating system. To process paths such as URLs
    that always use forward slashes regardless of the operating
    system, see the [path] package.
**/
@:go.Type({ name: "filepath", instanceName: "filepath.filepath", imports: ["path/filepath"] })
extern class Filepath {

    @:native("ListSeparator") static var listSeparator: go.Rune;
    @:native("Separator") static var separator: go.Rune;

    /**
        Abs returns an absolute representation of path.
        If the path is not absolute it will be joined with the current
        working directory to turn it into an absolute path. The absolute
        path name for a given file is not guaranteed to be unique.
        Abs calls [Clean] on the result.
    **/
    @:native("Abs") static function abs(path: String): (go.Result<String>);
    /**
        Base returns the last element of path.
        Trailing path separators are removed before extracting the last element.
        If the path is empty, Base returns ".".
        If the path consists entirely of separators, Base returns a single separator.
    **/
    @:native("Base") static function base(path: String): (String);
    /**
        Clean returns the shortest path name equivalent to path
        by purely lexical processing. It applies the following rules
        iteratively until no further processing can be done:
        
         1. Replace multiple [Separator] elements with a single one.
         2. Eliminate each . path name element (the current directory).
         3. Eliminate each inner .. path name element (the parent directory)
            along with the non-.. element that precedes it.
         4. Eliminate .. elements that begin a rooted path:
            that is, replace "/.." by "/" at the beginning of a path,
            assuming Separator is '/'.
        
        The returned path ends in a slash only if it represents a root directory,
        such as "/" on Unix or `C:\` on Windows.
        
        Finally, any occurrences of slash are replaced by Separator.
        
        If the result of this process is an empty string, Clean
        returns the string ".".
        
        On Windows, Clean does not modify the volume name other than to replace
        occurrences of "/" with `\`.
        For example, Clean("//host/share/../x") returns `\\host\share\x`.
        
        See also Rob Pike, “Lexical File Names in Plan 9 or
        Getting Dot-Dot Right,”
        https://9p.io/sys/doc/lexnames.html
    **/
    @:native("Clean") static function clean(path: String): (String);
    /**
        Dir returns all but the last element of path, typically the path's directory.
        After dropping the final element, Dir calls [Clean] on the path and trailing
        slashes are removed.
        If the path is empty, Dir returns ".".
        If the path consists entirely of separators, Dir returns a single separator.
        The returned path does not end in a separator unless it is the root directory.
    **/
    @:native("Dir") static function dir(path: String): (String);
    /**
        EvalSymlinks returns the path name after the evaluation of any symbolic
        links.
        If path is relative the result will be relative to the current directory,
        unless one of the components is an absolute symbolic link.
        EvalSymlinks calls [Clean] on the result.
    **/
    @:native("EvalSymlinks") static function evalSymlinks(path: String): (go.Result<String>);
    /**
        Ext returns the file name extension used by path.
        The extension is the suffix beginning at the final dot
        in the final element of path; it is empty if there is
        no dot.
    **/
    @:native("Ext") static function ext(path: String): (String);
    /**
        FromSlash returns the result of replacing each slash ('/') character
        in path with a separator character. Multiple slashes are replaced
        by multiple separators.
        
        See also the Localize function, which converts a slash-separated path
        as used by the io/fs package to an operating system path.
    **/
    @:native("FromSlash") static function fromSlash(path: String): (String);
    /**
        Glob returns the names of all files matching pattern or nil
        if there is no matching file. The syntax of patterns is the same
        as in [Match]. The pattern may describe hierarchical names such as
        /usr/* /bin/ed (assuming the [Separator] is '/').
        
        Glob ignores file system errors such as I/O errors reading directories.
        The only possible returned error is [ErrBadPattern], when pattern
        is malformed.
    **/
    @:native("Glob") static function glob(pattern: String): (go.Result<go.Slice<String>>);
    /**
        HasPrefix exists for historical compatibility and should not be used.
        
        Deprecated: HasPrefix does not respect path boundaries and
        does not ignore case when required.
    **/
    @:native("HasPrefix") static function hasPrefix(p: String, prefix: String): (Bool);
    /**
        IsAbs reports whether the path is absolute.
    **/
    @:native("IsAbs") static function isAbs(path: String): (Bool);
    /**
        IsLocal reports whether path, using lexical analysis only, has all of these properties:
        
          - is within the subtree rooted at the directory in which path is evaluated
          - is not an absolute path
          - is not empty
          - on Windows, is not a reserved name such as "NUL"
        
        If IsLocal(path) returns true, then
        Join(base, path) will always produce a path contained within base and
        Clean(path) will always produce an unrooted path with no ".." path elements.
        
        IsLocal is a purely lexical operation.
        In particular, it does not account for the effect of any symbolic links
        that may exist in the filesystem.
    **/
    @:native("IsLocal") static function isLocal(path: String): (Bool);
    /**
        Join joins any number of path elements into a single path,
        separating them with an OS specific [Separator]. Empty elements
        are ignored. The result is Cleaned. However, if the argument
        list is empty or all its elements are empty, Join returns
        an empty string.
        On Windows, the result will only be a UNC path if the first
        non-empty element is a UNC path.
    **/
    @:native("Join") static function join(elem: haxe.Rest<String>): (String);
    /**
        Localize converts a slash-separated path into an operating system path.
        The input path must be a valid path as reported by [io/fs.ValidPath].
        
        Localize returns an error if the path cannot be represented by the operating system.
        For example, the path a\b is rejected on Windows, on which \ is a separator
        character and cannot be part of a filename.
        
        The path returned by Localize will always be local, as reported by IsLocal.
    **/
    @:native("Localize") static function localize(path: String): (go.Result<String>);
    /**
        Match reports whether name matches the shell file name pattern.
        The pattern syntax is:
        
        	pattern:
        		{ term }
        	term:
        		'*'         matches any sequence of non-Separator characters
        		'?'         matches any single non-Separator character
        		'[' [ '^' ] { character-range } ']'
        		            character class (must be non-empty)
        		c           matches character c (c != '*', '?', '\\', '[')
        		'\\' c      matches character c (except on Windows)
        
        	character-range:
        		c           matches character c (c != '\\', '-', ']')
        		'\\' c      matches character c (except on Windows)
        		lo '-' hi   matches character c for lo <= c <= hi
        
        Path segments in the pattern must be separated by [Separator].
        
        Match requires pattern to match all of name, not just a substring.
        The only possible returned error is [ErrBadPattern], when pattern
        is malformed.
        
        On Windows, escaping is disabled. Instead, '\\' is treated as
        path separator.
    **/
    @:native("Match") static function match(pattern: String, name: String): (go.Result<Bool>);
    /**
        Rel returns a relative path that is lexically equivalent to targPath when
        joined to basePath with an intervening separator. That is,
        [Join](basePath, Rel(basePath, targPath)) is equivalent to targPath itself.
        
        The returned path will always be relative to basePath, even if basePath and
        targPath share no elements. Rel calls [Clean] on the result.
        
        An error is returned if targPath can't be made relative to basePath
        or if knowing the current working directory would be necessary to compute it.
    **/
    @:native("Rel") static function rel(basePath: String, targPath: String): (go.Result<String>);
    /**
        Split splits path immediately following the final [Separator],
        separating it into a directory and file name component.
        If there is no Separator in path, Split returns an empty dir
        and file set to path.
        The returned values have the property that path = dir+file.
    **/
    @:go.Tuple("dir", "file") @:native("Split") static function split(path: String): (go.Tuple<{ dir: String, file: String }>);
    /**
        SplitList splits a list of paths joined by the OS-specific [ListSeparator],
        usually found in PATH or GOPATH environment variables.
        Unlike strings.Split, SplitList returns an empty slice when passed an empty
        string.
    **/
    @:native("SplitList") static function splitList(path: String): (go.Slice<String>);
    /**
        ToSlash returns the result of replacing each separator character
        in path with a slash ('/') character. Multiple separators are
        replaced by multiple slashes.
    **/
    @:native("ToSlash") static function toSlash(path: String): (String);
    /**
        VolumeName returns leading volume name.
        Given "C:\foo\bar" it returns "C:" on Windows.
        Given "\\host\share\foo" it returns "\\host\share".
        On other platforms it returns "".
    **/
    @:native("VolumeName") static function volumeName(path: String): (String);
    /**
        Walk walks the file tree rooted at root, calling fn for each file or
        directory in the tree, including root.
        
        All errors that arise visiting files and directories are filtered by fn:
        see the [WalkFunc] documentation for details.
        
        The files are walked in lexical order, which makes the output deterministic
        but requires Walk to read an entire directory into memory before proceeding
        to walk that directory.
        
        Walk does not follow symbolic links.
        
        Walk is less efficient than [WalkDir], introduced in Go 1.16,
        which avoids calling os.Lstat on every visited file or directory.
    **/
    @:native("Walk") static function walk(root: String, fn: go.path.filepath.WalkFunc): (go.Error);
    /**
        WalkDir walks the file tree rooted at root, calling fn for each file or
        directory in the tree, including root.
        
        All errors that arise visiting files and directories are filtered by fn:
        see the [fs.WalkDirFunc] documentation for details.
        
        The files are walked in lexical order, which makes the output deterministic
        but requires WalkDir to read an entire directory into memory before proceeding
        to walk that directory.
        
        WalkDir does not follow symbolic links.
        
        WalkDir calls fn with paths that use the separator character appropriate
        for the operating system. This is unlike [io/fs.WalkDir], which always
        uses slash separated paths.
    **/
    @:native("WalkDir") static function walkDir(root: String, fn: go.io.fs.WalkDirFunc): (go.Error);

}