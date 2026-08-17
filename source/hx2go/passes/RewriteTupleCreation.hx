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

class RewriteTupleCreation extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TCast({ expr: TObjectDecl(_) }, _): true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch expr.expr {
            case TCast({ expr: TObjectDecl(fields) }, _): {
                var sorted = fields.copy();
                sorted.sort((a, b) -> Reflect.compare(a.name, b.name));

                var idx = 0;
                var ret = switch frame.field.expr.expr.t {
                    case TFun(_, ret) if (ret.match(TType({ name: "Tuple", pack: ["go"] }, _))): ret;
                    case _: return;
                };

                for (f in sorted) {
                    var rt = switch ret {
                        case TType({ name: "Tuple", pack: ["go"] }, [TAnon(anon)]): anon.fields.filter(a -> a.name == f.name)[0];
                        case _: null;
                    }

                    var o = ExprHelper.createCast(f.expr, rt.type);
                    f.expr.expr = o.expr;
                    f.expr.t = o.t;

                    context.submitNode(f.expr, true);
                }

                 expr.expr = ExprHelper.createUntyped('${context.getWriter().types.writeHxbType(ret)}{ ${sorted.map(_ -> '{${idx++}}').join(', ')} }', sorted.map(f -> f.expr)).expr;
            }

            case _: null;
        }
    }

}