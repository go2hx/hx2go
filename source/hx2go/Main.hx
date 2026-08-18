package hx2go;

import haxe.io.Bytes;
import haxe.io.Path;
import sys.FileSystem;
import hxb.Hxb;
import hxb.HxbModule.HxbImport;
import hxb.HxbArchive;

#if go
import go.Map;
#end


class Main {

    public static function main() {
        var args = Sys.args();
        var root = Sys.getCwd();

        var relativeInput = args[0] ?? "output.hxb";
        var relativeOutput = args[1] ?? ".";
        var mainClass = args[2] ?? "Main";
        var singleFile = (args[3] == "1") ?? false;
        var sourcelineComments = (args[4] == "1") ?? false;
        var resSerialized = args[5];
        var res:haxe.ds.Map<String, Bytes> = haxe.Unserializer.run(resSerialized);
        var times = (args[6] == "1") ?? false;
        var codegenVersion = args[7] ?? "";

        // accept both absolute paths (-D go-bootstrap) and relative paths
        var absoluteOutput = Path.isAbsolute(relativeOutput) ? relativeOutput : Path.join([ root, relativeOutput ]);
        var absoluteInput = Path.isAbsolute(relativeInput) ? relativeInput : Path.join([ root, relativeInput ]);

        exec(absoluteInput, absoluteOutput, mainClass, singleFile, sourcelineComments, res, times, codegenVersion);
    }

    public static function importToPath(imp: HxbImport): String {
        return imp.pack.length > 0 ? '${imp.pack.join(".")}.${imp.name}' : imp.name;
    }

    public static function exec(input: String, output: String, mainClass: String, singleFile:Bool, sourcelineComments:Bool, res:haxe.ds.Map<String, Bytes>, timesBool:Bool = false, codegenVersion:String = ""): Void {
        final start = Sys.time();
        if (!FileSystem.exists(input)) {
            Sys.println("HXB not found: " + input);
            Sys.exit(1);
        }

        var times = new hx2go.util.Times(timesBool);

        var closeHxb = times.start("hxb");
        var arc = Hxb.loadArchive(input);
        closeHxb();

        generate(arc, output, mainClass, singleFile, sourcelineComments, res, times, codegenVersion);

        final end = Sys.time();
        Sys.println('hx2go took ${Std.string(Math.round((end - start) * 100000) / 100)}ms');
    }

    public static function generate(archive: HxbArchive, absoluteOutput: String, mainClass: String, singleFile:Bool, sourcelineComments:Bool, res:haxe.ds.Map<String, Bytes>, times:hx2go.util.Times, codegenVersion:String = ""): Void {
        if (!FileSystem.exists(absoluteOutput)) {
            FileSystem.createDirectory(absoluteOutput);
        }

        var ctx = new hx2go.Context(archive, absoluteOutput, sourcelineComments, times, codegenVersion);
        ctx.build(mainClass, singleFile, res);
        ctx.times.report(Sys.println);
    }

}