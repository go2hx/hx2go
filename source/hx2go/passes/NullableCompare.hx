package hx2go.passes;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.HxbModuleType;
import hx2go.util.TypeHelper;
import hx2go.util.ExprHelper;
import hx2go.preprocessor.Semantics;
import hx2go.hxb.Ast.HxbBinop;
import hx2go.hxb.HxbType;

class NullableCompare extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TBinop(OpEq, { t: TAbstract({ pack: [], name: 'Null' }) }, _) |
                 TBinop(OpEq, { t: TAbstract({ pack: [], name: 'Null' }) }, _): true;

            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, type: HxbModuleType): Void {
        trace(expr);
    }

}