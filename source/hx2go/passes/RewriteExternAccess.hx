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

private enum ExternKind {
    ExNone;
    ExModule;
}

class RewriteExternAccess implements ICompilerPass {

    private var context: Context;

    public function new(context: Context) {
        this.context = context;
    }

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
                                case ":go.Module": return { kind: ExModule, options: m.params[0], left: left, right: ref.name };
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

                for (opt in options) {
                    switch opt.name {
                        case "name":
                            typeName = switch opt.expr?.expr {
                                case EConst(CString(x, _)): x;
                                case _: "";
                            }

                        case "pascalCase":
                            pascalCase = switch opt.expr?.expr {
                                case EConst(CIdent(x)): pascalCase = (x == "true");
                                case _: null;
                            }

                        case "imports":
                            switch opt.expr?.expr {
                                case EArrayDecl(imports):
                                    for (imp in imports) {
                                        context.defineImport(type, switch imp?.expr {
                                            case EConst(CString(x, _)): x;
                                            case _: null;
                                        });
                                    }

                                case _: null;
                            }

                        case _: null;
                    }
                }

                if (pascalCase) {
                    fieldName = StringConversions.toPascalCase(fieldName);
                }

                expr.expr = ExprHelper.createUntyped(context, '$typeName.$fieldName', []).expr;
            }

            case _: null;
        }
    }

}