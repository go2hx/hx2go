package hx2go.passes;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.HxbModuleType;
import hx2go.util.TypeHelper;
import hx2go.util.ExprHelper;
import hx2go.normaliser.Semantics;
import hx2go.hxb.Ast.HxbBinop;
import hx2go.hxb.HxbType;
import haxe.runtime.Copy;
import hx2go.hxb.Typed.HxbTypedExprDef;

class NullableConst extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch [expr.expr, expr.t] {
            case [TConst(TNull), TAbstract({ pack: [], name: 'Null' }, _)]: true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        expr.expr = switch expr.expr {
            case TConst(TNull): ExprHelper.createUntyped('${context.getWriter().types.writeHxbType(expr.t)}{}', []).expr;
            case _: expr.expr; // this guard is required because of the comparison pass
        }
    }

}