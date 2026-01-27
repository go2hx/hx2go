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

    public function resolveClass(pack:Array<String>, name:String, origin:String): HaxeTypeDefinition {
        final path = pack.join(".") + (pack.length > 0 ? "." : "") + name;
        final module = context.getModule(path);


        if (module == null) {
            return null;
        }

        for (def in module.defs) {
            switch def.kind {
                case TDClass:
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

        trace("def not found in module: ", pack, name);
        return null;
    }

    public function addDef(def:HaxeTypeDefinition) {
        defs.push(def);
    }

    public function run() {
        if (path == null) {
            trace('invalid path');
            return;
        }

        transformer.module = this;
        preprocessor.module = this;
        for (def in defs) {
            if (def == null) {
                trace('null def');
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
        // TODO
        throw "not implemented yet";
    }
}
