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
import hx2go.hxb.tools.TypedExprTools;

class TypeNormaliserReturn extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TReturn(e): true;
            case _: false;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch expr.expr {
            case TReturn(e) if (e?.t != null):
                var want = enclosingReturnType(frame, expr);
                if (want != null && want != TVoid && !TypeHelper.compare(e.t, want)) {
                    var o = ExprHelper.createCast(e, want);
                    expr.expr = TReturn(o);
                    context.submitNode(expr, true, 1);
                }

            case _: null;
        }
    }

    function enclosingReturnType(frame: ContextFrame, target: HxbTypedExpr): Null<HxbType> {
        var fieldRet = switch frame.field.type {
            case TFun(_, want): want;
            case _: null;
        };

        var root = frame.field?.expr?.expr;
        if (root == null || root == target) {
            return fieldRet;
        }

        var foundRet: Null<HxbType> = null;
        TypedExprTools.iter(root, c -> {
            if (foundRet == null) {
                foundRet = searchForRet(c, fieldRet, target);
            }
        });

        return foundRet ?? fieldRet;
    }

    function searchForRet(node: HxbTypedExpr, scopeRet: Null<HxbType>, target: HxbTypedExpr): Null<HxbType> {
        if (node == target) {
            return scopeRet;
        }

        var childScope = switch node.expr {
            case TFunction(fn): fn.t;
            case _: scopeRet;
        };

        var found: Null<HxbType> = null;
        TypedExprTools.iter(node, c -> {
            if (found == null) {
                found = searchForRet(c, childScope, target);
            }
        });

        return found;
    }

}