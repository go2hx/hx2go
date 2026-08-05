package hx2go.passes;

import hxb.Typed.HxbTypedExpr;
import hxb.HxbModuleType;
import hxb.Typed.HxbTypedExprDef;
import hxb.Typed.HxbFieldAccess;
import hx2go.util.ExprHelper;
import haxe.runtime.Copy;
import haxe.runtime.Copy.Copy.copy;

class RewriteGoUIntNegativeConst extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TCall({ expr: TField(_, FStatic({ name: 'Go', pack: ['go'] }, { name: 'uint' | 'uint32' | 'uint64' })) }, [{expr: TConst(TInt(_)), pos: _}] ):
                true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch expr.expr {
            case TCall({ expr: TField(_, FStatic({ name: 'Go', pack: ['go'] }, _)) }, [param] ): {
                switch param.expr {
                    case TConst(TInt(i)):
                        if (i < 0) {
                            var x = (i : haxe.UInt32);
                            param.expr = TConst(TFloat(Std.string(x)));
                            context.submitNode(expr, true);
                        }
                    default:
                }
            }

            case _:
        }
    }

}