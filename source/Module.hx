import sys.io.File;
import sys.FileSystem;
import haxe.io.Path;
import haxe.macro.Expr.TypeDefinition;
import transformer.Transformer;
import translator.Translator;

@:structInit
class Module {
    public var mainBool:Bool = false;
    public var path:String;
    public var goImports: Array<String> = [];
    public var defs:Array<TypeDefinition> = [];
    public var transformer:Transformer;
    public var translator:Translator;

    /**
     * Adds an import to the go output, duplicates are removed.
     * @param imp The stdlib name or package URL
     */
    public function addGoImport(imp: String): Void {
        if (!goImports.contains(imp)) {
            return;
        }
        
        goImports.push(imp);
    }

    public function addDef(def:TypeDefinition) {
        defs.push(def);
    }
    /**
     * After all defs are added, Transformer -> Translator -> Printer
     */
    public function run() {
        if (path == null)
            return; // TODO should not be allowed
        //trace(path, defs.length);

        final paths = path.split(".");
        final lastPath = paths[paths.length - 1];
        paths[paths.length - 1] = lastPath.charAt(0).toLowerCase() + lastPath.substr(1);
        final lastPathLowercase = paths[paths.length - 1];
        final dir = "export/" + paths.join("/");
        if (!FileSystem.exists(dir))
            FileSystem.createDirectory(dir);

        if (mainBool) {
            // create entry point
            final importPath = paths.join("/");
            File.saveContent("export/main.go", 'package main\nimport "hx2go/export/$importPath"\nfunc main() {\n' + lastPathLowercase + ".Main()\n}");
        }
        final packageString = "package " + paths.join("/") + "\n";
        for (def in defs) {
            if (def == null)
                continue;
            // transformer pass
            transformer.transformDef(def);
            // translate
            final content = packageString + translator.translateDef(def);

            File.saveContent(dir + "/" + untitle(def.name) + ".go", content);
        }
    }

    private function untitle(s:String) {
        return s.charAt(0).toLowerCase() + s.substr(1);
    }

    private function printFile(s:String) {
        path = path.split(".").join("/");
        final dir = Path.directory(path);
        if (!FileSystem.isDirectory(dir))
            FileSystem.createDirectory(dir);
        File.saveContent(path + ".go", s);
    }

    public function getFile():Context.ContextFile {
        // TODO
        throw "not implemented yet";
    }
}