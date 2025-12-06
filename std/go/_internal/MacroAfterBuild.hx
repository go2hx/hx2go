package go._internal;
#if macro
import haxe.macro.Context;
import haxe.macro.Compiler;
import haxe.Timer;
class MacroAfterBuild {
    public static function init() {
        final stamp = Timer.stamp();
        var runGoDefine = Context.definedValue("run-go");
        Context.onAfterGenerate(() -> {
            // spin up hx2go to read dump
            final mainClass = Compiler.getConfiguration().mainClass;
            final tmpMainSubPaths = [mainClass.name];
            if (mainClass.sub != null)
                tmpMainSubPaths.push(mainClass.sub);
            final mainString = mainClass.pack.concat(tmpMainSubPaths).join(".");
            final outputString = Compiler.getOutput();
            Sys.println("Haxe compilation time: " + (Timer.stamp() - stamp));
            var command = "haxe compile.hxml -D hx2go-main=\"" + mainString + "\" -D output=" + outputString;
            if (runGoDefine != null) {
                command += " -D run-go";
            }
            Sys.command(command);
        });
    }
}
#end