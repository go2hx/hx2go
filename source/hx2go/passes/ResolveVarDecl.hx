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
import hx2go.hxb.tools.TypeTools;
import hx2go.hxb.HxbType;

class ResolveVarDecl extends CompilerPass {

    public function match(expr: HxbTypedExpr): Bool {
        return switch expr.expr {
            case TVar(_): true;
            case _: false;
        }
    }

    public function resolveType(type: HxbType, frame: ContextFrame): Void {
        var tp = switch type {
            case TInst(tp, _): tp;
            case TAbstract(tp, _): tp;
            case TType(tp, _): tp;
            case TEnum(tp, _): tp;
            case _: return;
        }

        var mt = context.resolve(tp);
        var meta = switch mt {
            case MClass(x): x.meta;
            case MAbstract(x): x.meta;
            case MTypedef(x): x.meta;
            case MEnum(x): x.meta;
        }

        var opts = null;
        for (m in meta) {
            switch m.name {
                case ":go.Type": opts = m.params[0];
                case _: null;
            }
        }

        if (opts == null) {
            return;
        }

        switch opts {
            case { expr: EObjectDecl(options) }: {
                for (opt in options) {
                    switch opt.name {
                        case "imports":
                            for (imp in ObjectFieldHelper.readStringList(opt)) {
                                context.defineImport(frame, imp);
                            }

                        case _: null;
                    }
                }
            }

            case _: null;
        }
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch expr.expr {
            case TVar(v, _): {
                TypeTools.walk(v.type, resolveType.bind(_, frame));
            }

            case _: null;
        }
    }

}