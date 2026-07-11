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
import hx2go.hxb.Typed.HxbVar;
import hx2go.hxb.Typed.HxbVarKind;

class CastRestTo extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TCall(_, p) if (p.filter(p -> false).length != 0): true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        trace(expr);
    }

}