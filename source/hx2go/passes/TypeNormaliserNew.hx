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
import hx2go.hxb.HxbType;
import haxe.runtime.Copy;
import hx2go.util.TypeHelper;

class TypeNormaliserNew extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TNew(_): true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch expr.expr {
            case TNew(tp, _, el): {
                var mt = context.resolve(tp);
                if (mt == null) {
                    return;
                }

                var ctor = switch mt {
                    case MClass(x): x.constructor;
                    case _: null;
                }

                if (ctor == null) {
                    return;
                }

                switch ctor.type {
                    case TFun(params, _):
                        for (idx in 0...el.length) {
                            var param = params[idx];
                            var arg = el[idx];

                            if (!TypeHelper.compare(param.t, arg.t)) {
                                var o = ExprHelper.createCast(arg, param.t);
                                arg.expr = o.expr;
                                arg.t = o.t;

                                context.submitNode(arg, true);
                            }
                        }
                    case _: null;
                }
            }

            case _: null;
        }
    }

}