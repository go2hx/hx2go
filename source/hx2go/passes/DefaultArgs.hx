package hx2go.passes;

import hxb.Typed.HxbTypedExpr;
import hxb.Typed.HxbTypedExprDef;
import hxb.Typed.HxbVar;
import hxb.Typed.HxbTConstant;
import hxb.Ast.HxbBinop;
import hxb.HxbType;
import hx2go.util.ExprHelper;

class DefaultArgs extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TFunction(func): func.args.filter(a -> a.value != null).length > 0;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch expr.expr {
            case TFunction(func):
                // reverse so arg0's guard ends up first after each unshift
                var i = func.args.length;
                while (i-- > 0) {
                    var arg = func.args[i];
                    if (arg.value == null) continue;

                    var v: HxbVar = arg.v;

                    if (v.type == null || !v.type.match(TAbstract({ name: "Null", pack: [] }, _))) continue;

                    var cond = new HxbTypedExpr(
                        TBinop(
                            OpEq,
                            new HxbTypedExpr(TLocal(v), v.type, v.pos),
                            new HxbTypedExpr(TConst(TNull), v.type, v.pos)
                        ),
                        TBool,
                        v.pos
                    );

                    var assign = new HxbTypedExpr(
                        TBinop(
                            OpAssign,
                            new HxbTypedExpr(TLocal(v), v.type, v.pos),
                            ExprHelper.createCast(arg.value, v.type)
                        ),
                        v.type,
                        v.pos
                    );
                    var body = new HxbTypedExpr(TBlock([ assign ]), TVoid, v.pos);
                    var guard = new HxbTypedExpr(TIf(cond, body, null), TVoid, v.pos);

                    ExprHelper.addExprToBlock(func.expr, guard);
                    context.submitNode(guard, true); // register into remaining passes
                }
            default:
        }
    }
}