import sys.FileSystem;

function main() {
    if (!FileSystem.exists("haxe")) {
        Sys.command("git clone -b go-target https://github.com/pxshadow/haxe");
    }
    Sys.setCwd("haxe");
    Sys.command("git pull");
    Sys.setCwd("tests/unit");
    // runTestSuite("macro");
    runTestSuite("go");
}

function runTestSuite(target:String) {
    var args = ['compile-$target.hxml'];
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
    if (code == 0) {
        Sys.command("go run -C ./bin/go/main .");
    }
}

#if macro
macro function getDefines():haxe.macro.Expr.ExprOf<Map<String,String>> {
    return macro $v{haxe.macro.Context.getDefines()};
}
#else
macro function getDefines():haxe.macro.Expr.ExprOf<Map<String,String>>;
#end