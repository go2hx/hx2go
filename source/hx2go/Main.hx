package hx2go;

import haxe.io.Path;
import sys.FileSystem;
import hx2go.hxb.HxbModuleType;
import hx2go.hxb.Hxb;
import hx2go.hxb.Typed.HxbModuleTypeRef;
import hx2go.hxb.HxbModule.HxbImport;

class Main {

    public static function main() {
        var args = Sys.args();
        var root = Sys.getCwd();

        var relativeInput = args[0] ?? "output.hxb";
        var relativeOutput = args[1] ?? ".";
        var mainClass = args[2] ?? "Main";

        var absoluteOutput = Path.join([ root, relativeOutput ]);
        var absoluteInput = Path.join([ root, relativeInput ]);

        exec(absoluteInput, absoluteOutput, mainClass);
    }

    public static function importToPath(imp: HxbImport): String {
        return imp.pack.length > 0 ? '${imp.pack.join(".")}.${imp.name}' : imp.name;
    }

    public static function exec(input: String, output: String, mainClass: String): Void {
        var arc = Hxb.loadArchive(input);
        var types = [];
        var walked: Map<String, Bool> = [];
        var walk: String -> Void;

        walk = imp -> {
            if (walked.exists(imp)) {
                return;
            }

            var ref = arc.findModule(imp, 'go');
            var mod = arc.decode(ref);

            for (child in mod.imports) {
                walk(importToPath(child));
            }

            types = types.concat(mod.types);
            walked.set(imp, true);
        };

        walk(mainClass);

        generate(types, output, mainClass);
    }

    public static function generate(types: Array<HxbModuleType>, absoluteOutput: String, mainClass: String): Void {
        if (!FileSystem.exists(absoluteOutput)) {
            FileSystem.createDirectory(absoluteOutput);
        }

        var ctx = new hx2go.Context(absoluteOutput);
        for (t in types) {
            ctx.add(t);
        }

        ctx.build(mainClass);
    }

}