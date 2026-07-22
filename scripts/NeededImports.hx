import sys.io.File;
import haxe.DynamicAccess;
import haxe.Json;
import sys.io.Process;
import haxe.io.Path;

var root = "";


function main() {
    root = Sys.getCwd();
    var imps:Array<String> = [];
    getImports(imps, "./output/bootstrap/main");
    getImports(imps, "./output/tests/main");

    var dir = runCommandReturnLine("haxelib", ["path", "go2hx"]);
    getImports(imps, Path.join([dir, "..", "/output/main"]));
    Sys.command('haxelib run go2hx -stdgen ${imps.join(" ")} ./std');
}

function runCommand(cmd:String, args:Array<String>):String {
    // trace(cmd + " " + args.join(" "));
    var proc = new Process(cmd, args);
    if (proc.exitCode() != 0)
        throw "failed command";
    var s = proc.stdout.readAll().toString();
    proc.close();
    return s;
}

function runCommandReturnLine(cmd:String, args:Array<String>):String {
    var proc = new Process(cmd, args);
    if (proc.exitCode() != 0)
        throw "failed command";
    var s = proc.stdout.readLine();
    proc.close();
    return s;
}

function getImports(imps:Array<String>, path:String) {
    Sys.setCwd(path);
    var jsonData = Json.parse(runCommand("go", ["list", "-json", "."]));
    var data:DynamicAccess<Dynamic> = jsonData;
    Sys.setCwd(root);
    var dataImports:Array<String> = data["Deps"];
    for (imp in dataImports) {
        if (imps.contains(imp)) {
            continue;
        }
        imps.push(imp);
    }
}