import haxe.macro.Expr.ComplexType;
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
    public var goImports:Array<String> = [];
    public var defs:Array<HaxeTypeDefinition> = [];
    public var preprocessor:Preprocessor;
    public var transformer:Transformer;
    public var translator:Translator;
    public var buf:StringBuf;
    public var context:Context;

    public function resolveClass(pack:Array<String>, name:String, origin:String): HaxeTypeDefinition {
        final path = (pack != null ? pack.join(".") + (pack.length > 0 ? "." : "") : "") + name;
        final module = context.getModule(path);
        if (module == null) {
            return null;
        }

        for (def in module.defs) {
            switch def.kind {
                case TDClass, TDType(_), TDEnum(_):
                    if (def.name.split(".").pop() == name) {
                        if (!def.usages.exists(origin)) {
                            def.usages[origin] = 0;
                        }

                        def.usages[origin] += 1;

                        return def;
                    }

                case _: null;
            }
        }

        Logging.module.warn('def not found in module: $name at $pack');
        return null;
    }

    /**
     * Adds an import to the go output, duplicates are removed.
     * @param imp The stdlib name or package URL
     */
    public function addGoImport(imp: String): Void {
        if (goImports.contains(imp)) {
            return;
        }

        goImports.push(imp);
    }

    public function addDef(def:HaxeTypeDefinition) {
        defs.push(def);
    }

    public function run() {
        if (path == null) {
            Logging.module.error('invalid path (null)');
            return;
        }

        translator.module = this;
        transformer.module = this;
        preprocessor.module = this;

        for (def in defs) {
            if (def == null) {
                Logging.module.warn('null def');
                continue;
            }

            transformer.def = def;
            preprocessor.def = def;

            preprocessor.processDef(def);
            transformer.transformDef(def);

            if (def.isExtern) {
                continue;
            }

            final output = translator.translateDef(def);
            def.buf.add(output);
        }
    }

    public function toGoPath(path:String):Array<String> {
        final paths = path.split(".");
        final lastPath = paths[paths.length - 1];
        paths[paths.length - 1] = lastPath.charAt(0).toLowerCase() + lastPath.substr(1);
        return paths;
    }

    public function getFile():Context.ContextFile {
        return {
            path: path.toLowerCase().split(".").join("_"),
            content: buf.toString(),
            module: this,
        }
    }


    public function follow(ct:ComplexType):ComplexType {
        return switch ct {
            case TPath({pack: [], name: "Null", params: [TPType(ct)]}):
                follow(ct);
            case TPath(p):
                final td = resolveClass(p.pack, p.name, path);
                if (td == null) {
                    ct;
                }else{
                    // trace(td.name);
                    switch td.kind {
                        case TDType(ct):
                            follow(ct);
                        case _:
                            ct;
                    }
                }
            default:
                ct;
        }
    }
}
