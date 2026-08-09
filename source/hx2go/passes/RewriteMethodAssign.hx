package hx2go.passes;

import hxb.Typed.HxbTypedExpr;
import hxb.Typed.HxbVar;
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
import hxb.HxbType;
import hxb.Typed.HxbTypedExprDef;
import hxb.HxbClassField;
import haxe.runtime.Copy;

class RewriteMethodAssign extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TBinop(OpAssign, { expr: TField(_, FInstance(_)) }, { t: TFun(_) }): true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch expr.expr {
            case TBinop(OpAssign, { expr: TField(e, FInstance(tp, p, cf)), t: ft }, ae): {
                var m = context.resolve(tp);
                if (m == null) {
                    return;
                }

                var current: HxbClass = switch m {
                    case MClass(x): x;
                    case _: return;
                }

                var fields = current.fields.filter(f -> f.kind.match(KMethod(MethDynamic)) && f.name == cf.name);
                if (fields.length == 0) {
                    return;
                }

                expr.expr = TBinop(
                    OpAssign,
                    new HxbTypedExpr(
                        TField(
                            Copy.copy(e),
                            FInstance(tp, p, {
                                owner: cf.owner,
                                kind: cf.kind,
                                name: '${StringConversions.nameToFieldName(cf.name)}_Dyn',
                                depth: cf.depth
                            })
                        ),
                        ft,
                        expr.pos
                    ),
                    ae
                );

                ae.t = context.getWriter().classes.appendThis(ae.t, current);

                switch ae.expr {
                    case TFunction(tfunc):
                        tfunc.args.unshift({
                            value: null,
                            v: new HxbVar(-1, "this", VUser(TVOLocalVariable), 0, [], ae.pos, TInst(current.path, [])),
                        });
                    case _:
                }
            };

            case _: null;
        }
    }

}