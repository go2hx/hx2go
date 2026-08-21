package hx2go.passes;

import hxb.Typed.HxbTypedExpr;
import hxb.HxbModuleType;
import hxb.Typed.HxbTypedExprDef;
import hxb.Typed.HxbFieldAccess;
import hx2go.util.ExprHelper;

class RewriteGoBuiltinCreation extends CompilerPass {

    static final BUILTINS: Map<String, String> = [
        "Chan" => "make(%T, {0})",
        "Slice" => "make(%T, {0})",
        "Map" => "%T{}",
    ];

    public function match(expr: HxbTypedExpr): Bool {
        return moduleOf(expr) != null;
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        var module = moduleOf(expr);
        if (module == null) return;

        var params = switch expr.expr {
            case TCall(_, el): el;
            case _: [];
        }

        var goType = context.getWriter().types.writeHxbType(expr.t).toString();
        var template = StringTools.replace(BUILTINS[module], "%T", goType);

        var forward = template.indexOf("{0}") != -1 ? params : [];
        var o = ExprHelper.createUntyped(template, forward);

        expr.expr = o.expr;
        expr.t = o.t;
    }

    static function moduleOf(expr: HxbTypedExpr): Null<String> {
        return switch expr.expr {
            case TCall({ expr: TField(_, FStatic({ name: name, moduleName: module, pack: ['go'] }, { name: '_create' })) }, _)
                if (name == module + "_Impl_" && BUILTINS.exists(module)): module;
            case _: null;
        }
    }

}
