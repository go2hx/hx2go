package hx2go;

import haxe.io.Path;
import sys.FileSystem;
import hx2go.hxb.HxbModuleType;
import hx2go.hxb.Hxb;

class Main {

    public static function main() {
        var args = Sys.args();
        var root = Sys.getCwd();

        var relativeInput = args[0] ?? "output.hxb";
        var relativeOutput = args[1] ?? ".";

        var absoluteOutput = Path.join([ root, relativeOutput ]);
        var absoluteInput = Path.join([ root, relativeInput ]);

        exec(absoluteInput, absoluteOutput);
    }

    public static function exec(input: String, output: String): Void {
        var arc = Hxb.loadArchive(input);
        var entries = arc.modules();
        var types = [];

        for (ref in entries) {
            if (ref.target != "go") { // hxb can contain multiple targets (like macro) and we only want the hx2go target
                continue;
            }

            var module = arc.decode(ref);
            for (type in module.types) {
                types.push(type);
            }
        }

        generate(types, output);
    }

    public static function generate(types: Array<HxbModuleType>, absoluteOutput: String): Void {
        if (!FileSystem.exists(absoluteOutput)) {
            FileSystem.createDirectory(absoluteOutput);
        }

        var ctx = new hx2go.Context(absoluteOutput);
        for (t in types) {
            ctx.add(t);
        }

        ctx.build();
    }

}