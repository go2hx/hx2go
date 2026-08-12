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
import hxb.HxbType;
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
            case TNew(tp, typeParams, el): {
                var mt = context.resolve(tp);
                if (mt == null) {
                    return;
                }

                var cls = switch mt {
                    case MClass(x): x;
                    case _: null;
                }

                if (cls == null) {
                    return;
                }

                if (cls.constructor == null) {
                    return;
                }

                switch cls.constructor.type {
                    case TFun(params, _):
                        if (cls.flags & HxbClassFlag.CExtern != 0 && cls.meta.filter(m -> m.name == ":structInit").length != 0) {
                            var argStr = [];
                            for (idx in 0...el.length) {
                                // cast each arg to the actual Go struct field type
                                var arg = el[idx];
                                var field = cls.fields.filter(f -> f.name == params[idx].name)[0];
                                if (field != null && arg.t != null && !TypeHelper.compare(arg.t, field.type)) {
                                    var c = ExprHelper.createCast(arg, field.type);
                                    arg.expr = c.expr;
                                    arg.t = c.t;
                                    context.submitNode(arg, true);
                                }
                                argStr.push('${StringConversions.toPascalCase(params[idx].name)}: {${idx}}');
                            }

                            expr.expr = ExprHelper.createUntyped('${context.getWriter().types.writeModuleType(tp, typeParams)}{ ${argStr.join(", ")} }', el).expr;
                            return;
                        }

                    case _: null;
                }
            }

            case _: null;
        }
    }

}