import sys.FileSystem;

function main() {
    if (!FileSystem.exists("haxe")) {
        Sys.command("git clone -b go-target https://github.com/pxshadow/haxe");
    }
    Sys.setCwd("haxe");
    Sys.command("git pull");
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