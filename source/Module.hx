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
    public var imports:Array<String> = [];
    public var preprocessor:Preprocessor;
    public var transformer:Transformer;
    public var translator:Translator;
    public var context:Context;

    public function canResolveLocalTypeParam(funcName:String, typeName:String):Bool {
        for (def in this.defs) {
            for (field in def.fields) {
                switch field.kind {
                    case FFun(f) if (f.params != null && f.params.length > 0):
                        for (param in f.params) {
                            if (param.name == typeName && field.name == toCamelCase(funcName)) {
                                return true;
                            }
                        }
                    default:
                        continue;
                }
            }
        }
        return false;
    }

    public function resolveLocalDef(module:Module, name:String) {
        for (def in module.defs) {
                switch def.kind {
                case TDClass if (def.name == name):
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
                // top level
                final sameNameModule = context.getModule(name);
                final globalDef = resolveGlobalDef(sameNameModule, name);
                return globalDef;
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

    public function resolveClass(pack:Array<String>, name:String, forceGlobalResolve: Bool = false):HaxeTypeDefinition {
        // trace(resolveModule);
        // local
        if (pack.length == 0 && !forceGlobalResolve) {
            return resolveLocalDef(this, name) ?? resolveClass(pack, name, true);
        }else{
            final resolveModule = pack.join(".") + (pack.length > 0 ? "." : "") + name;
            // global
            final module = context.getModule(resolveModule);
            return resolveGlobalDef(module, resolveModule);
        }
    }

    public function addDef(def:HaxeTypeDefinition) {
        defs.push(def);
    }

    function hasGoPackageMetadata(td:HaxeTypeDefinition) {
        for (meta in td.meta()) {
            switch meta.name {
                case ":go.package", ":go.toplevel":
                    return true;
            }
        }
        return false;
    }

    function hasCoreTypeMetadata(td:HaxeTypeDefinition) {
        for (meta in td.meta()) {
            switch meta.name {
                case ":coreType":
                    return true;
            }
        }
        return false;
    }

    public function addImport(modulePath:String) {
        switch modulePath {
            // Add TODO temporarily until we know when to exclude extern classes
            case "StdTypes", "go.Syntax":
                return;
        }
        final td = resolveClass([], modulePath);
        // prevent import if typedef is null
        if (td == null) {
            return;
        }else{
            if (hasGoPackageMetadata(td) || hasCoreTypeMetadata(td) || td.isExtern)
                return;
        }
        imports.push(modulePath);
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

        final paths = toGoPath(path);
        final lastPathLowercase = paths[paths.length - 1];
        final dir = context.options.output + "/" + paths.join("/");
        if (!FileSystem.exists(dir))
            FileSystem.createDirectory(dir);

        if (mainBool) {
            // create entry point
            final importPath = paths.join("/");
            File.saveContent(context.options.output + "/main.go", 'package main\nimport "hx2go/$importPath"\nfunc main() {\n' + lastPathLowercase + ".Main()\n}");
        }
        var prefixString = "package " + paths.pop() + "\n";
        for (imp in imports) {
            imp = toGoPath(imp).join("/");
            prefixString += 'import "hx2go/$imp"\n';
        }
        for (def in defs) {
            if (def == null)
                continue;
            transformer.def = def;
            preprocessor.def = def;
            // preprocessor pass
            preprocessor.processDef(def);
            // transformer pass
            transformer.transformDef(def);
            if (hasGoPackageMetadata(def) || hasCoreTypeMetadata(def) || def.isExtern)
                continue;
            // translate
            var content = translator.translateDef(def);
            // imports
            File.saveContent(dir + "/" + toCamelCase(def.name) + ".go", prefixString + content);
        }
    }

    public function toGoPath(path:String):Array<String> {
        final paths = path.split(".");
        final lastPath = paths[paths.length - 1];
        paths[paths.length - 1] = lastPath.charAt(0).toLowerCase() + lastPath.substr(1);
        return paths;
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
