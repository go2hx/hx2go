package hx2go.passes;

import hxb.Typed.HxbTypedExpr;
import hxb.HxbModuleType;
import hx2go.util.TypeHelper;
import hx2go.util.ExprHelper;
import hx2go.normaliser.Semantics;
import hxb.Ast.HxbBinop;
import hxb.HxbType;
import haxe.runtime.Copy;
import hxb.flags.HxbClassFlag;

class InterfaceDynamic extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TCast({ t: TInst(_) }, _) if (expr.t.match(TDynamic(_) | TDynamicAny)): true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch [expr.expr, expr.expr] {
            case [TCast(e, _), TCast({ t: TInst(tp, _ )}, _)]: {
                switch context.resolve(tp) {
                    case MClass(x) if (x.flags & HxbClassFlag.CInterface != 0): {
                        expr.expr = ExprHelper.createUntyped("any({0}.VTable)", [e]).expr;
                    }

                    case _: return;
                }
            }

            case _: false;
        }
    }

}