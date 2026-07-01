package hx2go.passes;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.HxbModuleType;
import hx2go.hxb.Typed.HxbTypedExprDef;
import hx2go.util.ExprHelper;
import hx2go.hxb.HxbType;
import hx2go.hxb.Ast.HxbBinop;

class RewriteDynamicBinop extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TBinop(OpAssign, _, _): false;
            case TBinop(_, { t: TDynamicAny | TDynamic(_) }, _) |
                 TBinop(_, _ , { t: TDynamicAny | TDynamic(_) }): true;
            case _: false;
        }
    }

    function toOperationFunction(op: HxbBinop): String {
        return switch op {
            case OpAdd: "add";
            case OpMult: "multiply";
            case OpDiv: "divide";
            case OpSub: "subtract";
            case OpEq: "equals";
            case OpNotEq: "nequals";
            case OpGt: "gt";
            case OpGte: "gtequals";
            case OpLt: "lt";
            case OpLte: "ltequals";
            case OpAnd: "bitand";
            case OpOr: "bitor";
            case OpXor: "bitxor";
            case OpBoolAnd: "and";
            case OpBoolOr: "or";
            case OpShl: "lbitshift";
            case OpShr: "rbitshift";
            case OpUShr: "urbitshift";
            case OpMod: "modulo";
            case OpAssign, OpInterval, OpArrow, OpIn, OpNullCoal: throw "Invalid promoteBinop with Dynamic (toDynamicOp)";
            case OpAssignOp(op): toOperationFunction(op);
        }
    }

    public function makeDynamicCall(left: HxbTypedExpr, right: HxbTypedExpr, call: String): HxbTypedExpr {
        var e = ExprHelper.createCallStatic(
            context,
            {
                name: 'HxDynamic',
                moduleName: 'HxDynamic',
                pack: ['go', 'hx2go']
            },
            call,
            [left, right]
        );
        e.t = TDynamicAny;

        return e;
    }

    function returnsBool(op: HxbBinop): Bool {
        return switch (op) {
            case OpEq, OpNotEq, OpGt, OpGte, OpLt, OpLte, OpOr, OpAnd:
                true;
            case _:
                false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch expr.expr {
            case TBinop(op, left, right): {
                if (!left.t.match(TDynamic(_) | TDynamicAny)) {
                    var o = ExprHelper.createCast(left, TDynamicAny);
                    left.expr = o.expr;
                    left.t = o.t;
                    context.submitNode(left, true);
                }

                if (!right.t.match(TDynamic(_) | TDynamicAny)) {
                    var o = ExprHelper.createCast(right, TDynamicAny);
                    right.expr = o.expr;
                    right.t = o.t;
                    context.submitNode(right, true);
                }

                var opName = toOperationFunction(op);
                var o = makeDynamicCall(left, right, opName);

                if (!expr.t.match(TDynamic(_) | TDynamicAny) && !returnsBool(op)) {
                    o = ExprHelper.createCast(o, expr.t);
                    context.submitNode(o, true);
                }

                if (op.match(OpAssignOp(_))) {
                    o = new HxbTypedExpr(
                        TBinop(OpAssign, left, o),
                        left.t,
                        left.pos
                    );
                }

                expr.expr = o.expr;
                expr.t = o.t;
            }

            case _: null;
        }
    }

}