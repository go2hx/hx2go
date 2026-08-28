package go.go.build;

/**
    A Context specifies the supporting context for a build.
**/
@:structInit
@:go.Type({ name: "Context", instanceName: "build.Context", imports: ["go/build"] })
extern class Context {

    @:native("GOARCH") var GOARCH: String;
    @:native("GOOS") var GOOS: String;
    @:native("GOROOT") var GOROOT: String;
    @:native("GOPATH") var GOPATH: String;
    @:native("Dir") var dir: String;
    @:native("CgoEnabled") var cgoEnabled: Bool;
    @:native("UseAllFiles") var useAllFiles: Bool;
    @:native("Compiler") var compiler: String;
    @:native("BuildTags") var buildTags: go.Slice<String>;
    @:native("ToolTags") var toolTags: go.Slice<String>;
    @:native("ReleaseTags") var releaseTags: go.Slice<String>;
    @:native("InstallSuffix") var installSuffix: String;
    @:native("JoinPath") var joinPath: (elem: haxe.Rest<String>) -> (String);
    @:native("SplitPathList") var splitPathList: (list: String) -> (go.Slice<String>);
    @:native("IsAbsPath") var isAbsPath: (path: String) -> (Bool);
    @:native("IsDir") var isDir: (path: String) -> (Bool);
    @:native("HasSubdir") var hasSubdir: (root: String, dir: String) -> (go.Tuple<{ rel: String, ok: Bool }>);
    @:native("ReadDir") var readDir: (dir: String) -> (go.Result<go.Slice<go.io.fs.FileInfo>>);
    @:native("OpenFile") var openFile: (path: String) -> (go.Result<go.io.ReadCloser>);

    function new(GOARCH: String="", GOOS: String="", GOROOT: String="", GOPATH: String="", dir: String="", cgoEnabled: Bool=false, useAllFiles: Bool=false, compiler: String="", buildTags: go.Slice<String>=null, toolTags: go.Slice<String>=null, releaseTags: go.Slice<String>=null, installSuffix: String="", joinPath: (elem: haxe.Rest<String>) -> (String)=null, splitPathList: (list: String) -> (go.Slice<String>)=null, isAbsPath: (path: String) -> (Bool)=null, isDir: (path: String) -> (Bool)=null, hasSubdir: (root: String, dir: String) -> (go.Tuple<{ rel: String, ok: Bool }>)=null, readDir: (dir: String) -> (go.Result<go.Slice<go.io.fs.FileInfo>>)=null, openFile: (path: String) -> (go.Result<go.io.ReadCloser>)=null);

    /**
        Import returns details about the Go package named by the import path,
        interpreting local import paths relative to the srcDir directory.
        If the path is a local import path naming a package that can be imported
        using a standard import path, the returned package will set p.ImportPath
        to that path.
        
        In the directory containing the package, .go, .c, .h, and .s files are
        considered part of the package except for:
        
          - .go files in package documentation
          - files starting with _ or . (likely editor temporary files)
          - files with build constraints not satisfied by the context
        
        If an error occurs, Import returns a non-nil error and a non-nil
        *[Package] containing partial information.
    **/
    @:native("Import") function _import(path: String, srcDir: String, mode: go.go.build.ImportMode): (go.Result<go.Pointer<go.go.build.Package>>);
    /**
        ImportDir is like [Import] but processes the Go package found in
        the named directory.
    **/
    @:native("ImportDir") function importDir(dir: String, mode: go.go.build.ImportMode): (go.Result<go.Pointer<go.go.build.Package>>);
    /**
        MatchFile reports whether the file with the given name in the given directory
        matches the context and would be included in a [Package] created by [ImportDir]
        of that directory.
        
        MatchFile considers the name of the file and may use ctxt.OpenFile to
        read some or all of the file's content.
    **/
    @:native("MatchFile") function matchFile(dir: String, name: String): (go.Result<Bool>);
    /**
        SrcDirs returns a list of package source root directories.
        It draws from the current Go root and Go path but omits directories
        that do not exist.
    **/
    @:native("SrcDirs") function srcDirs(): (go.Slice<String>);

}