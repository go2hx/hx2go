import preprocessor.Preprocessor;
import translator.TranslatorTools.toCamelCase;
import sys.io.File;
import sys.FileSystem;
import haxe.io.Path;
import HaxeExpr.HaxeTypeDefinition;
import transformer.Transformer;
import translator.Translator;

@:structInit
class Module {
    public var mainBool:Bool = false;
    public var path:String;
    public var defs:Array<HaxeTypeDefinition> = [];
    public var preprocessor:Preprocessor;
    public var transformer:Transformer;
    public var translator:Translator;
    public var context:Context;

    public function resolveLocalDef(module:Module, name:String) {
        for (def in module.defs) {
                switch def.kind {
                case TDClass:
                    if (def.name == name)
                        return def;
                default:
            }
        }
        switch name {
            case "String":
                final module = context.getModule("String");
                return resolveGlobalDef(module, name);
            case "Float", "Int", "Single", "Bool":
                // StdTypes is module
                // global
                final module = context.getModule("StdTypes");
                return resolveGlobalDef(module, name);
            default:
                final sameNameModule = context.getModule(name);
                return resolveGlobalDef(sameNameModule, name);
        }
        trace("not resolving def: " + module + " " + name);
        return null;
    }

     public function resolveGlobalDef(module:Module, name:String) {
        if (module == null)
            return null;
        for (def in module.defs) {
                switch def.kind {
                case TDClass:
                    if (def.name == name)
                        return def;
                default:
            }
        }
        trace("WARNING not resolving def: " + name);
        return null;
    }

    public function resolveClass(pack:Array<String>, name:String):HaxeTypeDefinition {
        var resolveModule = pack.join(".") + (pack.length > 0 ? "." : "") + name;
        // trace(resolveModule);
        // local
        if (pack.length == 0) {
            return resolveLocalDef(this, name);
        }else{
            // global
            final module = context.getModule(resolveModule);
            return resolveGlobalDef(module, resolveModule);
        }
    }

    public function addDef(def:HaxeTypeDefinition) {
        defs.push(def);
    }
    /**
     * After all defs are added, Transformer -> Translator -> Printer
     */
    public function run() {
        if (path == null)
            return; // TODO should not be allowed
        transformer.module = this;
        preprocessor.module = this;
        //trace(path, defs.length);

        final paths = path.split(".");
        final lastPath = paths[paths.length - 1];
        paths[paths.length - 1] = lastPath.charAt(0).toLowerCase() + lastPath.substr(1);
        final lastPathLowercase = paths[paths.length - 1];
        final dir = context.options.output + "/" + paths.join("/");
        if (!FileSystem.exists(dir))
            FileSystem.createDirectory(dir);

        if (mainBool) {
            // create entry point
            final importPath = paths.join("/");
            File.saveContent(context.options.output + "/main.go", 'package main\nimport "hx2go/$importPath"\nfunc main() {\n' + lastPathLowercase + ".Main()\n}");
        }
        var prefixString = "package " + paths.join("/") + "\n";
        for (def in defs) {
            if (def == null)
                continue;
            transformer.def = def;
            preprocessor.def = def;
            // preprocessor pass
            preprocessor.processDef(def);
            // transformer pass
            transformer.transformDef(def);
            // translate
            var content = translator.translateDef(def);
            // imports
            File.saveContent(dir + "/" + toCamelCase(def.name) + ".go", prefixString + content);
        }
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
