import sys.io.File;
import haxe.io.Path;
import sys.FileSystem;
import haxe.macro.Compiler;
import haxe.macro.Context;
import haxe.macro.Printer;
import haxe.macro.Expr;
import haxe.macro.ExprTools;

class MacroTest {
    public static macro function assert(comparison:Expr):Expr {
        var name = ExprTools.toString(comparison);
        final pos = Context.currentPos();
        final expr = macro {
            var name = $v{name};
            if ($comparison) {
                @:pos(pos) TestAll.logOk(name);
            } else {
                @:pos(pos) TestAll.logFail(name);
            }
        };
        return expr;
    }
    public static macro function runTests(varName:Expr, pkgs:Array<Expr>):Expr {
        final exprs:Array<Expr> = [];
        final printer = new Printer();
        var paths = pkgs.map(e -> switch e.expr {
            case EConst(CIdent(s)):
                s;
            default:
                "";
        });
        var runs:Array<Expr> = [];
        var goDefined = Context.defined("go");
        for (path in paths) {
            var dir = "tests/" + path + "/";
            for (filePath in FileSystem.readDirectory(dir)) {
                final name = Path.withoutExtension(filePath);
                if (!goDefined) {
                    final content = File.getContent(dir + filePath);
                    if (content.indexOf("import go.") != -1) {
                        continue;
                    }
                }
                runs.push(macro unit.$name.main());
            }
        }
        return macro $b{runs};
    }
}