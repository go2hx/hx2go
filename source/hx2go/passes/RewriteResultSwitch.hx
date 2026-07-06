package hx2go.passes;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.flags.HxbClassFlag;
import hx2go.hxb.Typed.HxbFieldAccess;
import hx2go.hxb.Ast.HxbExpr;
import hx2go.hxb.Ast.HxbExprDef.EObjectDecl;
import hx2go.hxb.Ast.HxbExprDef.EConst;
import hx2go.hxb.Ast.HxbExprDef.EArrayDecl;
import hx2go.hxb.HxbModuleType;
import hx2go.util.ExprHelper;
import hx2go.util.StringConversions;
import hx2go.hxb.Ast.HxbObjectField;
import hx2go.util.ObjectFieldHelper;
import hx2go.hxb.flags.HxbClassFieldFlag;
import haxe.runtime.Copy;
import hx2go.hxb.Typed.HxbVar;

class RewriteResultSwitch extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TSwitch({ expr: TParenthesis({ expr: TEnumIndex(e) }) }, _, _) if (e.t != null && e.t.match(TEnum({ pack: ['go'], name: 'ResultKind' }, _))): true;
            case _: false;
        }
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
                            ExprHelper.createUntyped('{0}.Error', [ Copy.copy(e) ]),
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