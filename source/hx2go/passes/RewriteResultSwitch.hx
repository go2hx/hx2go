package hx2go.passes;

import hxb.Typed.HxbTypedExpr;
import hxb.flags.HxbClassFlag;
import hxb.Typed.HxbFieldAccess;
import hxb.Ast.HxbExpr;
import hxb.Ast.HxbExprDef.EObjectDecl;
import hxb.Ast.HxbExprDef.EConst;
import hxb.Ast.HxbExprDef.EArrayDecl;
import hxb.HxbModuleType;
import hx2go.util.ExprHelper;
import hx2go.util.StringConversions;
import hxb.Ast.HxbObjectField;
import hx2go.util.ObjectFieldHelper;
import hxb.flags.HxbClassFieldFlag;
import hxb.Typed.HxbVar;
import hxb.HxbType;

class RewriteResultSwitch extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TSwitch({ expr: TParenthesis({ expr: TEnumIndex(e) }) }, _, _) if (isResult(e.t)): true;
            case _: false;
        }
    }

    public static function isResult(t: HxbType): Bool {
        return t != null && (
            t.match(TEnum({ pack: ['go'], name: 'ResultKind' }, _)) ||
            t.match(TAbstract({ pack: ['go'], name: 'Result' }, _))
        );
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch expr.expr {
            case TSwitch({ expr: TParenthesis({ expr: TEnumIndex(e) }) }, cases, edef): {
                var head = edef;
                var idx = 0;

                for (c in cases) {
                    if (c.patterns.length > 1) {
                        throw "Result switch case may only have one pattern";
                    }

                    head = idx == 0 && cases.length > 1 ? c.expr : new HxbTypedExpr(TIf(
                        new HxbTypedExpr(TBinop(
                            c.patterns[0].expr.match(TConst(TInt(0))) ? OpEq : OpNotEq,
                            ExprHelper.createUntyped('{0}.Error', [ hx2go.normaliser.ExprCopy.copy(e) ]),
                            new HxbTypedExpr(TConst(TNull), e.t, e.pos)
                        ), TBool, e.pos),
                        c.expr,
                        head
                    ), expr.t, expr.pos);

                    idx++;
                }

                expr.expr = head.expr;
                context.submitNode(expr, true);
            }

            case _: null;
        }
    }

}