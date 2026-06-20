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

private enum ExternKind {
    ExNone;
    ExModule;
}

class RewriteExternAccess extends CompilerPass {

    private function getExternInfo(expr: HxbTypedExpr): { kind: ExternKind, ?options: HxbExpr, ?left: HxbTypedExpr, ?right: String } {
        return switch expr.expr {
            case TField(left, FStatic(tp, ref)): {
                var mt = context.resolve(tp);
                if (mt == null) {
                    return { kind: ExNone };
                }

                return switch mt {
                    case MClass(cls): {
                        if ((cls.flags & HxbClassFlag.CExtern) == 0) {
                            return { kind: ExNone };
                        }

                        for (m in cls.meta) {
                            switch m.name {
                                case ":go.Type": return { kind: ExModule, options: m.params[0], left: left, right: ref.name };
                                case _: null;
                            }
                        }

                        return { kind: ExNone };
                    }

                    case _: { kind: ExNone };
                }
            }

            case _: { kind: ExNone };
        }
    }

    public function match(expr: HxbTypedExpr): Bool {
        return getExternInfo(expr).kind != ExNone;
    }

    public function execute(expr: HxbTypedExpr, type: HxbModuleType): Void {
        switch getExternInfo(expr) {
            case { kind: ExModule, options: { expr: EObjectDecl(options) }, right: fieldName }: {
                var typeName = "";
                var pascalCase = true;
                var topLevel = false;

                for (opt in options) {
                    switch opt.name {
                        case "name":
                            typeName = ObjectFieldHelper.readString(opt);

                        case "pascalCase":
                            pascalCase = ObjectFieldHelper.readBool(opt, pascalCase);

                        case "topLevel":
                            topLevel = ObjectFieldHelper.readBool(opt, topLevel);

                        case "imports":
                            for (imp in ObjectFieldHelper.readStringList(opt)) {
                                context.defineImport(type, imp);
                            }

                        case _: null;
                    }
                }

                if (pascalCase) {
                    fieldName = StringConversions.toPascalCase(fieldName);
                }

                expr.expr = ExprHelper.createUntyped(context, (topLevel ? '' : '$typeName.') + fieldName, []).expr;
            }

            case _: null;
        }
    }

}