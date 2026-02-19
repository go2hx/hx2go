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

			function success() {
				@:pos(pos) Sys.println('  ${TestAll.green("[OK]")} $name'); //trace('  ${TestAll.green("[OK]")} $name');
				TestAll.passed++;
			}
			function failure(message:String) {
				@:pos(pos) Sys.println('  ${TestAll.green("[OK]")} $name'); //trace('  ${TestAll.red("[FAIL]")} $name: $message');
				TestAll.failed++;
			}
			#if deep_equal
			switch deepequal.DeepEqual.compare(expected, actual) {
				case Success(_): // they are value-identical
					success();
				case Failure(f):
					failure(f.message);
			}
			#else
			if (expected == actual) {
				success();
			} else {
				failure("not equal");
			}
			#end
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
