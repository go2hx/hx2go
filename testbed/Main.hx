@:go.Type({ name: "packages", instanceName: "packages.LoadMode", imports: ["golang.org/x/tools/go/packages"] })
extern class LoadMode {
    static var NeedName: LoadMode;
    static var NeedFiles: LoadMode;
    static var NeedCompiledGoFiles: LoadMode;
    static var NeedImports: LoadMode;
    static var NeedDeps: LoadMode;
    static var NeedExportFile: LoadMode;
    static var NeedTypes: LoadMode;
    static var NeedSyntax: LoadMode;
    static var NeedTypesInfo: LoadMode;
    static var NeedTypesSizes: LoadMode;
    static var NeedForTest: LoadMode;
    static var NeedModule: LoadMode;
    static var NeedEmbedFiles: LoadMode;
    static var NeedEmbedPatterns: LoadMode;
    static var NeedTarget: LoadMode;
}

@:structInit
@:go.Type({ name: "packages.Config", imports: ["golang.org/x/tools/go/packages"] })
extern class Config {
    public var mode: LoadMode;
}

function main() {
    var v: Config = {
        mode: LoadMode.NeedFiles
    }
}