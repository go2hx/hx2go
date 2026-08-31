package go.debug;

/**
    Package buildinfo provides access to information embedded in a Go binary
    about how it was built. This includes the Go toolchain version, and the
    set of modules used (for binaries built in module mode).
    
    Build information is available for the currently running binary in
    runtime/debug.ReadBuildInfo.
**/
@:go.Type({ name: "buildinfo", instanceName: "buildinfo.buildinfo", imports: ["debug/buildinfo"] })
extern class Buildinfo {

    /**
        Read returns build information embedded in a Go binary file
        accessed through the given ReaderAt. Most information is only available for
        binaries built with module support.
    **/
    @:native("Read") static function read(r: go.io.ReaderAt): (go.Result<go.Pointer<go.debug.buildinfo.BuildInfo>>);
    /**
        ReadFile returns build information embedded in a Go binary
        file at the given path. Most information is only available for binaries built
        with module support.
    **/
    @:native("ReadFile") static function readFile(name: String): (go.Result<go.Pointer<go.debug.buildinfo.BuildInfo>>);

}