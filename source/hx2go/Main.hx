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
        var singleFile = (args[3] == "1") ?? false;
        var sourcelineComments = (args[4] == "1") ?? false;

        // accept both absolute paths (-D go-bootstrap) and relative paths
        var absoluteOutput = Path.isAbsolute(relativeOutput) ? relativeOutput : Path.join([ root, relativeOutput ]);
        var absoluteInput = Path.isAbsolute(relativeInput) ? relativeInput : Path.join([ root, relativeInput ]);

        exec(absoluteInput, absoluteOutput, mainClass, singleFile, sourcelineComments);
    }

    public static function importToPath(imp: HxbImport): String {
        return imp.pack.length > 0 ? '${imp.pack.join(".")}.${imp.name}' : imp.name;
    }

    public static function exec(input: String, output: String, mainClass: String, singleFile:Bool, sourcelineComments:Bool): Void {
        final start = Sys.time();
        if (!FileSystem.exists(input)) {
            Sys.println("HXB not found: " + input);
            Sys.exit(1);
        }
        var arc = Hxb.loadArchive(input);
        generate(arc, output, mainClass, singleFile, sourcelineComments);

        final end = Sys.time();
        Sys.println('hx2go took ${Std.string(Math.round((end - start) * 100000) / 100)}ms');
    }

    public static function generate(archive: HxbArchive, absoluteOutput: String, mainClass: String, singleFile:Bool, sourcelineComments:Bool): Void {
        if (!FileSystem.exists(absoluteOutput)) {
            FileSystem.createDirectory(absoluteOutput);
        }

        var ctx = new hx2go.Context(archive, absoluteOutput, sourcelineComments);
        ctx.build(mainClass, singleFile);
    }

}