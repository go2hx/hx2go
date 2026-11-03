import sys.FileSystem;
import haxe.io.Path;


var HAXE_COMMIT = "166a035d17b2453453ef3d7c7ea5932cf6d0c055";

function main() {
    if (!FileSystem.exists("haxe")) {
        Sys.command("git clone https://github.com/haxefoundation/haxe");
    }
    Sys.setCwd("haxe");
    Sys.command("git checkout development");
    // -D haxe-latest
    #if !haxe_latest
    Sys.command('git fetch origin $HAXE_COMMIT');
    #end
    Sys.command("git reset --hard");
    Sys.command("git pull");
    applyPatches("../tests/haxepatches");
    Sys.setCwd("tests/unit");
    // runTestSuite("macro");
    #if threads
    Sys.setCwd("../threads");
    runTestSuite(["build.hxml", "-lib", "hx2go", "--custom-target", "go=bin/go", "-D", "go-no-sourcemaps", "-D", "go-no-line-directives"]);
    #elseif testsys
    Sys.setCwd("../sys");
    runTestSuite(["compile-go.hxml"], false);

    Sys.putEnv("EXISTS", "1");
    Sys.exit(Sys.command(FileSystem.absolutePath("bin/go/sys/main/" + exe("main")), []));
    #else
    runTestSuite(["compile-go.hxml"]);
    #end
}

function applyPatches(dir:String) {
    var patches = [];
    collectPatches(dir, patches);
    patches.sort(Reflect.compare);
    for (patch in patches) {
        var target = patch.substr(dir.length + 1);
        target = target.substr(0, target.length - ".patch".length);
        if (Sys.command('git checkout -- "$target" 2>/dev/null') != 0 && FileSystem.exists(target))
            FileSystem.deleteFile(target);
        if (Sys.command('git apply --check "$patch"') != 0)
            throw 'Patch no longer applies (upstream touched these lines): $patch';
        if (Sys.command('git apply "$patch"') != 0)
            throw 'Failed to apply patch: $patch';
    }
    Sys.println('applied ${patches.length} patches from $dir');
}

function collectPatches(dir:String, out:Array<String>) {
    if (!FileSystem.exists(dir))
        throw 'patches directory not found: $dir';
    for (entry in FileSystem.readDirectory(dir)) {
        var full = Path.join([dir, entry]);
        if (FileSystem.isDirectory(full)) {
            collectPatches(full, out);
        } else if (StringTools.endsWith(entry, ".patch")) {
            out.push(full);
        }
    }
}


function runCommand(command:String):Bool {
    Sys.println(command);
    return Sys.command(command) == 0;
}

function exe(name:String):String {
    return name + (Sys.systemName() == "Windows" ? ".exe" : "");
}

function runTestSuite(args:Array<String>, run:Bool=true) {
    var defines:Map<String,String> = getDefines();
    for (key => value in defines) {
        if (key.indexOf("target") != -1)
            continue;
        switch key {
            case "eval", "true", "sys", "haxe-ver", "haxe_ver", "haxe":
                continue;
        }
        args.push("-D");
        if (value == "1") {
            args.push(key);
        }else{
            args.push(key + "=" + value);
        }
    }
    Sys.println("cwd: " + Sys.getCwd());
    Sys.println("haxe " + args.join(" "));
    var code = Sys.command('haxe', args);
    if (run) {
        if (code == 0) {
            code = Sys.command("go run -C ./bin/go/main -gcflags=all=-e .");
        }
        Sys.exit(code);
    }else if (code != 0) {
        Sys.exit(code);
    }
}

#if macro
macro function getDefines():haxe.macro.Expr.ExprOf<Map<String,String>> {
    return macro $v{haxe.macro.Context.getDefines()};
}
#else
macro function getDefines():haxe.macro.Expr.ExprOf<Map<String,String>>;
#end