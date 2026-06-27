package hx2go.passes;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.HxbModuleType;
import hx2go.hxb.Typed.HxbTypedExprDef;
import hx2go.hxb.HxbType;
import hx2go.util.ExprHelper;
import haxe.runtime.Copy;
import hx2go.hxb.Typed.HxbVar;
import hx2go.hxb.Ast.HxbUnop;
import hx2go.hxb.Ast.HxbBinop;

class RewriteDynamicUnop extends CompilerPass { // only for OpIncrement / OpDecrement

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TUnop(OpIncrement | OpDecrement, _, { t: TDynamic(_) | TDynamicAny }): true;
            case _: false;
        }
    }

    public function unopToBinop(op: HxbUnop): HxbBinop {
        return switch op {
            case OpIncrement: OpAdd;
            case OpDecrement: OpSub;
            case _: throw "bad dyn unop";
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        var tmp = new HxbVar(
            -1,
            "hx_dyn_unop",
            VUser(TVOLocalVariable),
            0,
            [],
            expr.pos,
            TDynamicAny
        );

        var tmp_ident = () -> new HxbTypedExpr(TLocal(tmp), tmp.type, tmp.pos);
        var assign_op = (e: HxbTypedExpr, op: HxbUnop) -> {
            return new HxbTypedExpr(TBinop(OpAssignOp(unopToBinop(op)), e, new HxbTypedExpr(TConst(TInt(1)), TInt, expr.pos)), expr.t, expr.pos);
        }

        var o = switch expr.expr {
            case TUnop(op, true, e):
                new HxbTypedExpr(TBlock([
                    new HxbTypedExpr(TVar(tmp, Copy.copy(e)), TVoid, expr.pos),
                    assign_op(Copy.copy(e), op),
                    tmp_ident()
                ]), TDynamicAny, expr.pos);

            case TUnop(op, false, e):
                assign_op(Copy.copy(e), op);

            case _: return;
        }

        expr.expr = o.expr;
        expr.t = o.t;

        context.submitNode(expr, true);
    }

}