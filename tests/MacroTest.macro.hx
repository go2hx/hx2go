import haxe.macro.Context;
import haxe.macro.Printer;
import haxe.macro.Expr;
import haxe.macro.ExprTools;

class MacroTest {
    public static macro function assert(actual:Expr, expected:Expr):Expr {
        var name = ExprTools.toString(actual);
        final pos = Context.currentPos();
        final expr = macro {
            final name = $v{name};
            final actual = $actual;
            final expected = $expected;
            switch deepequal.DeepEqual.compare(expected, actual) {
                case Success(_): // they are value-identical
                    @:pos(pos) trace('  ${TestAll.green("[OK]")} $name');
                    TestAll.passed++;
                case Failure(f): 
                    // trace(f.message, f.data); // they are different!
                    @:pos(pos) trace('  ${TestAll.red("[FAIL]")} $name: ${f.message}');
                    TestAll.failed++;
            }
        };
        return expr;
    }
    public static macro function runTests(varName:Expr, expr:Expr):Expr {
        final exprs:Array<Expr> = [];
        final printer = new Printer();
        final tests = switch expr.expr {
            case EBlock(exprs):
                exprs;
            default:
                throw "expr is not EBlock: " + expr.expr;
        }
        for (testExpr in tests) {
            switch testExpr.expr {
                case ECall(e, params):
                    final testName = printer.printExpr(e).split(".").shift();
                    // check if testName has been ran
                    exprs.push(macro if (!alreadyRan.contains($v{testName}) && (varName == $v{testName} || $varName == "*")) {
                        $testExpr;
                        alreadyRan.push($v{testName});
                        continue;
                    });
                default:
                    trace(Context.currentPos());
                    throw "test expr must be ECall: " + testExpr.expr;
            }
        }
        return macro {
            final varName = $varName;
            final alreadyRan = [];
            while (true) {
                $b{exprs};
                break;
            }
        };
    }
}