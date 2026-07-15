package go.go.build;

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
    @:native("JoinPath") var joinPath: (elem: haxe.Rest<String>) -> String;
    @:native("SplitPathList") var splitPathList: (list: String) -> go.Slice<String>;
    @:native("IsAbsPath") var isAbsPath: (path: String) -> Bool;
    @:native("IsDir") var isDir: (path: String) -> Bool;
    @:native("HasSubdir") var hasSubdir: (root: String, dir: String) -> go.Tuple<{ rel: String, ok: Bool }>;
    @:native("ReadDir") var readDir: (dir: String) -> go.Result<go.Slice<go.io.fs.FileInfo>>;
    @:native("OpenFile") var openFile: (path: String) -> go.Result<go.io.ReadCloser>;

function new(GOARCH: String, GOOS: String, GOROOT: String, GOPATH: String, dir: String, cgoEnabled: Bool, useAllFiles: Bool, compiler: String, buildTags: go.Slice<String>, toolTags: go.Slice<String>, releaseTags: go.Slice<String>, installSuffix: String, joinPath: (elem: haxe.Rest<String>) -> String, splitPathList: (list: String) -> go.Slice<String>, isAbsPath: (path: String) -> Bool, isDir: (path: String) -> Bool, hasSubdir: (root: String, dir: String) -> go.Tuple<{ rel: String, ok: Bool }>, readDir: (dir: String) -> go.Result<go.Slice<go.io.fs.FileInfo>>, openFile: (path: String) -> go.Result<go.io.ReadCloser>);

    @:native("Import") function _import(path: String, srcDir: String, mode: go.go.build.ImportMode): go.Result<go.Pointer<go.go.build.Package>>;
    @:native("ImportDir") function importDir(dir: String, mode: go.go.build.ImportMode): go.Result<go.Pointer<go.go.build.Package>>;
    @:native("MatchFile") function matchFile(dir: String, name: String): go.Result<Bool>;
    @:native("SrcDirs") function srcDirs(): go.Slice<String>;

}