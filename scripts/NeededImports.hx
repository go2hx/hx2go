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

    var dir = runCommandReturnLine("haxelib", ["path", "hx2go-extern"]);
    getImports(imps, Path.join([dir, "..", "/output/main"]));
    Sys.command('haxelib run hx2go-extern -stdgen ${imps.join(" ")} ./std');
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

function runCommandReturnLine(cmd:String, args:Array<String>):String {
    return runCommand(cmd, args).split("\n")[0];
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