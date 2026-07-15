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
import hx2go.hxb.Typed.HxbTypedExprDef;
import hx2go.hxb.Ast.HxbExprDef;
import hx2go.hxb.HxbClassField;
import hx2go.hxb.HxbType;

private enum ExternKind {
    ExNone;
    ExModule;
    ExTemplate;
}

class FieldAccessExtern extends CompilerPass {

    public static function getExternInfo(context: Context, expr: HxbTypedExpr): { kind: ExternKind, ?options: HxbExpr, ?left: HxbTypedExpr, ?right: String, ?field: HxbClassField } {
        return switch expr.expr {
            case TField(left, FAnon(cf)):
                var mt = context.resolve(switch left.t {
                    case TType(tp, _): tp;
                    case _: return { kind: ExNone };
                });

                if (mt == null) {
                    return { kind: ExNone };
                }

                return switch mt {
                    case MTypedef(t): {
                        var anon = switch t.type {
                            case TAnon(x): x;
                            case _: return { kind: ExNone };
                        }

                        var name = cf.name;
                        var info = anon.fields.filter(x -> x.name == cf.name)[0];

                        for (fm in info.meta) {
                            switch fm.name {
                                case ":native":
                                    name = switch fm.params[0].expr {
                                        case EConst(CString(s, _)): s;
                                        case _: name;
                                    }

                                case _: null;
                            }
                        }

                        for (m in t.meta) {
                            switch m.name {
                                case ":go.Type": return { kind: ExModule, options: m.params[0], left: left, right: name, field: info };
                                case _: null;
                            }
                        }

                        return { kind: ExTemplate, field: info };
                    }

                    case _: { kind: ExNone };
                }

            case TField(left, FStatic(tp, ref) | FInstance(tp, _, ref)): {
                var mt = context.resolve(tp);
                if (mt == null) {
                    return { kind: ExNone };
                }

                return switch mt {
                    case MClass(cls): {
                        var name = ref.name;
                        var info = cls.statics.concat(cls.fields).filter(x -> x.name == ref.name)[0];

                        if ((cls.flags & HxbClassFlag.CExtern) == 0) {
                            return { kind: ExNone, field: info };
                        }

                        for (fm in info.meta) {
                            switch fm.name {
                                case ":native":
                                    name = switch fm.params[0].expr {
                                        case EConst(CString(s, _)): s;
                                        case _: name;
                                    }

                                case _: null;
                            }
                        }

                        for (m in cls.meta) {
                            switch m.name {
                                case ":go.Type": return { kind: ExModule, options: m.params[0], left: left, right: name, field: info };
                                case _: null;
                            }
                        }

                        return { kind: ExTemplate, field: info };
                    }

                    case _: { kind: ExNone };
                }
            }

            case _: { kind: ExNone };
        }
    }

    public function match(expr: HxbTypedExpr): Bool {
        return getExternInfo(context, expr).kind != ExNone;
    }

    public function execute(expr: HxbTypedExpr, frame: ContextFrame): Void {
        switch getExternInfo(context, expr) {
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
                                context.defineImport(frame, imp);
                            }

                        case _: null;
                    }
                }

                if (pascalCase) {
                    fieldName = StringConversions.toPascalCase(fieldName);
                }

                expr.expr = switch expr.expr {
                    case TField(_, FStatic(_)): ExprHelper.createUntyped((topLevel ? '' : '$typeName.') + fieldName, []).expr;
                    case TField(e, FInstance(_) | FAnon(_)): ExprHelper.createUntyped((topLevel ? '' : '{0}.') + fieldName, [e]).expr;
                    case _: expr.expr;
                }
            }

            case _: null;
        }
    }

}