package hx2go.passes;

import hxb.Typed.HxbTypedExpr;
import hxb.HxbModuleType;
import hxb.Typed.HxbTypedExprDef;
import hx2go.util.ExprHelper;
import hxb.HxbType;
import hxb.Ast.HxbBinop;

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
                pack: ['go', 'haxe']
            },
            call,
            hx2go.normaliser.ExprCopy.copyList([left, right])
        );
        e.t = TDynamicAny;

        return e;
    }

    public static function returnsBool(op: HxbBinop): Bool {
        return switch (op) {
            case OpEq, OpNotEq, OpGt, OpGte, OpLt, OpLte, OpBoolOr, OpBoolAnd:
                true;
            case _:
                false;
        }
    }

    public static function takesBool(op: HxbBinop): Bool {
        return switch (op) {
            case OpBoolOr, OpBoolAnd:
                true;
            case _:
                false;
        }
    }

    public function inlineCast(e: HxbTypedExpr, t: HxbType): Void {
        var o = ExprHelper.createCast(e, t);
        e.expr = o.expr;
        e.t = o.t;
        context.submitNode(e, true);
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch expr.expr {
            case TBinop(op, left, right): {
                // if assignOp keep lhs
                var assignTarget = op.match(OpAssignOp(_)) ? hx2go.normaliser.ExprCopy.copy(left) : null;
                var isBooleanOp = takesBool(op);

                if (isBooleanOp && !left.t.match(TBool)) inlineCast(left, TBool);
                else if (!isBooleanOp && !left.t.match(TDynamic(_) | TDynamicAny)) inlineCast(left, TDynamicAny);

                if (isBooleanOp && !right.t.match(TBool)) inlineCast(right, TBool);
                else if (!isBooleanOp && !right.t.match(TDynamic(_) | TDynamicAny)) inlineCast(right, TDynamicAny);

                if (isBooleanOp) {
                    return;
                }

                var opName = toOperationFunction(op);
                var o = makeDynamicCall(left, right, opName);
                if (!expr.t.match(TDynamic(_) | TDynamicAny)) {
                    o = ExprHelper.createCast(o, expr.t);
                }else if (returnsBool(op)) {
                    o = ExprHelper.createCast(o, expr.t);
                    o.t = TBool;
                }

                if (op.match(OpAssignOp(_))) {
                    o = new HxbTypedExpr(
                        TBinop(OpAssign, assignTarget, o),
                        assignTarget.t,
                        assignTarget.pos
                    );

                    context.submitNode(assignTarget, true);
                }

                expr.expr = o.expr;
                expr.t = o.t;

                context.submitNode(expr, true);
            }

            case _: null;
        }
    }

}