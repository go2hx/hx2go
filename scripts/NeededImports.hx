import sys.FileSystem;
import sys.io.File;
import sys.io.Process;
import haxe.io.Path;

var root = "";


function main() {
    root = Sys.getCwd();
    var imps:Array<String> = [];
    getImports(imps, "./output/bootstrap/main");
    getGoImports(imps, "std");

    var externDir = Path.join([root, "hx2go-extern"]);
    var bin = Path.join([externDir, "output", "main", "main"]);
    if (Sys.systemName().toLowerCase() == "windows") bin += ".exe";
    if (!FileSystem.exists(bin)) {
        Sys.println("Building hx2go-extern...");
        var oldCwd = Sys.getCwd();
        Sys.setCwd(externDir);
        Sys.command("haxe", ["Compile.hxml"]);
        Sys.setCwd(oldCwd);
    }
    getImports(imps, Path.join([externDir, "output/main"]));
    Sys.command(bin, ["-stdgen"].concat(imps).concat(["./std", root]));
}

function runCommand(cmd:String, args:Array<String>):String {
    trace(cmd + " " + args.join(" "));
    var proc = new Process(cmd, args);
    // drain before exit
    var s = proc.stdout.readAll().toString();
    if (proc.exitCode() != 0)
        throw "failed command: " + cmd + " " + args.join(" ");
    proc.close();
    return s;
}



function getImports(imps:Array<String>, path:String) {
    if (FileSystem.exists(path)) {
        Sys.setCwd(path);
    }
    getGoImports(imps, ".");
    Sys.setCwd(root);
}

function isMetaPattern(goPath:String):Bool {
    return goPath == "std" || goPath == "all" || goPath == "cmd" || goPath.indexOf("...") != -1;
}

function getGoImports(imps:Array<String>, goPath:String) {
    var template = isMetaPattern(goPath) ? '{{.ImportPath}}' : '{{range .Imports}}{{.}}{{"\\n"}}{{end}}';
    for (line in runCommand("go", ["list", "-f", template, goPath]).split("\n")) {
        var imp = StringTools.trim(line);
        if (imp == "" || imps.contains(imp)) {
            continue;
        }
        imps.push(imp);
    }
}