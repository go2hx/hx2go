package hx2go;

import haxe.io.Path;
import sys.FileSystem;
import hx2go.hxb.Hxb;
import hx2go.hxb.HxbModule.HxbImport;
import hx2go.hxb.HxbArchive;

class Main {

    public static function main() {
        var args = Sys.args();
        var root = Sys.getCwd();

        var relativeInput = args[0] ?? "output.hxb";
        var relativeOutput = args[1] ?? ".";
        var mainClass = args[2] ?? "Main";

        // accept both absolute paths (-D go-bootstrap) and relative paths
        var absoluteOutput = Path.isAbsolute(relativeOutput) ? relativeOutput : Path.join([ root, relativeOutput ]);
        var absoluteInput = Path.isAbsolute(relativeInput) ? relativeInput : Path.join([ root, relativeInput ]);

        exec(absoluteInput, absoluteOutput, mainClass);
    }

    public static function importToPath(imp: HxbImport): String {
        return imp.pack.length > 0 ? '${imp.pack.join(".")}.${imp.name}' : imp.name;
    }

    public static function exec(input: String, output: String, mainClass: String): Void {
        final start = Sys.time();

        var arc = Hxb.loadArchive(input);
        generate(arc, output, mainClass);

        final end = Sys.time();
        Sys.println('hx2go took ${Std.string(Math.round((end - start) * 100000) / 100)}ms');
    }

    public static function generate(archive: HxbArchive, absoluteOutput: String, mainClass: String): Void {
        if (!FileSystem.exists(absoluteOutput)) {
            FileSystem.createDirectory(absoluteOutput);
        }

        var ctx = new hx2go.Context(archive, absoluteOutput);
        ctx.build(mainClass);
    }

}