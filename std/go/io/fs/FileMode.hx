package go.io.fs;

/**
    A FileMode represents a file's mode and permission bits.
    The bits have the same definition on all systems, so that
    information about files can be moved from one system
    to another portably. Not all bits apply to all systems.
    The only required bit is [ModeDir] for directories.
**/
@:go.Type({ name: "FileMode", instanceName: "fs.FileMode", imports: ["io/fs"] })
extern typedef FileMode = haxe.extern.EitherType<go.UInt32, {
    /**
        IsDir reports whether m describes a directory.
        That is, it tests for the [ModeDir] bit being set in m.
    **/
    @:native("IsDir") function isDir(): (Bool);
    /**
        IsRegular reports whether m describes a regular file.
        That is, it tests that no mode type bits are set.
    **/
    @:native("IsRegular") function isRegular(): (Bool);
    /**
        Perm returns the Unix permission bits in m (m & [ModePerm]).
    **/
    @:native("Perm") function perm(): (go.io.fs.FileMode);
    @:native("String") function string(): (String);
    /**
        Type returns type bits in m (m & [ModeType]).
    **/
    @:native("Type") function type(): (go.io.fs.FileMode);

}>