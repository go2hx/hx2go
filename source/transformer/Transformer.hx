package transformer;

import HaxeExpr;
import HaxeExpr.HaxeTypeDefinition;
import HaxeExpr.HaxeTypeDefinition;
import haxe.macro.Expr.TypeDefinition;
import haxe.macro.ComplexTypeTools;
import haxe.macro.Expr;
import transformer.exprs.*;

/**
 * Transforms Haxe AST to Go ready Haxe AST
 * For example, changes try catch to defer panic pattern
 */
@:structInit
class Transformer {
    public var module:Module = null;
    public var def:HaxeTypeDefinition = null;
    public function transformExpr(e:HaxeExpr, ?parent:HaxeExpr, ?parentIdx:Int) {
        if (e == null || e.def == null)
            return;
        if (parent != null)
            e.parent = parent;
            e.parentIdx = parentIdx;

        switch e.def {
            case EConst(c):
                Const.transformConst(this, e);
            case ETry(_, _):
                Try.transformTry(this, e);
            case EField(_, _, _):
                FieldAccess.transformFieldAccess(this, e);
            case EWhile(cond, body, norm):
                While.transformWhile(this, e, cond, body, norm);
            case EIf(cond, branchTrue, branchFalse):
                If.transformIf(this, e, cond, branchTrue, branchFalse);
            case EVars(vars):
                VarDeclarations.transformVarDeclarations(this, e, vars);
            case EBinop(op, e1, e2):
                BinopExpr.transformBinop(this, e, op, e1, e2);
            case ECast(_, t):
                Cast.transformCast(this, e, t);
            default:
                iterateExpr(e);
        }
    }
    public function iterateExpr(e:HaxeExpr) {
        var idx = 0;
        HaxeExprTools.iter(e, (le) -> {
            transformExpr(le, e, idx);
            idx++;
        });
    }
    public function transformComplexType(ct:ComplexType) {
        if (ct == null) {
            return;
        }

        switch ct {
            case TPath(p):
                // transform params of complexType
                if (p.params != null) {
                    for (param in p.params) {
                        switch param {
                            case TPType(t2):
                                transformComplexType(t2);
                            default:

                        }
                    }
                }
                // has already been resolved, because prefix lowercase is not valid Haxe code
                // I don't love this hack, would prefer to have the transformer only go over once
                if (isLowercasePrefix(p.name))
                    return;
                final td = module.resolveClass(p.pack, p.name);
                if (td == null) {
                    // check if function generic
                    if (p.pack.length == 1) {
                        if (module.canResolveLocalTypeParam(p.pack[0], p.name)) {
                            p.pack = [];
                        }
                    }else{
                        trace('td is null in transformComplexType for' + ct);
                    }
                    return;
                }

                for (meta in td.meta()) {
                    switch meta.name {
                        case ":coreType":
                            p.pack = [];
                            p.name = switch td.name {
                                case "go.Float32", "Single": "float32";
                                case "go.Float64", "Float": "float64";
                                case "go.Int64", "Int64": "int64";
                                case "go.Int32", "Int": "int32";
                                case "go.Int16": "int16";
                                case "go.Int8": "int8";
                                case "go.GoInt": "int";
                                case "go.UInt64": "uint64";
                                case "go.UInt32": "uint32";
                                case "go.UInt16": "uint16";
                                case "go.UInt8": "uint8";
                                case "go.GoUInt": "uint";
                                case "go.Rune": "rune";
                                case "go.Byte": "byte";
                                case "go.Slice": '[]${transformComplexTypeParam(p.params, 0)}';
                                case "go.Pointer": '*${transformComplexTypeParam(p.params, 0)}';
                                case "go.Nullable": '${transformComplexTypeParam(p.params, 0)}';
                                case "Bool": "bool";
                                case "Dynamic": "map[string]dynamic";
                                case _:
                                    trace("unhandled coreType: " + td.name);
                                    "#UNKNOWN_TYPE";
                            }
                            p.params = switch td.name {
                                case "go.Slice" | "go.Nullable" | "go.Pointer": [];
                                case _: p.params;
                            }

                        case ":go.native":
                            p.pack = [];
                            p.params = [];
                            p.name = exprToString(meta.params[0]);

                        case ":go.package":
                            def.addGoImport(exprToString(meta.params[0]));
                    }
                }

                p.name = switch (td.name) {
                    case "String": "string"; // string doesn't have @:coreType
                    case "Unknown": "any"; // must be resolved in Go
                    case _: p.name;
                }
            default:
        }
    }

    public function transformComplexTypeParam(params: Array<TypeParam>, idx: Int) {
        final p = params[idx];
        if (p == null) {
            return "any";
        }

        final ct = switch (p) {
            case TPType(x): x;
            case TPExpr(_): null;
        }

        if (ct == null) {
            trace('@:const type parameter on @:generic class not supported!');
            return "any";
        }

        transformComplexType(ct);
        return ComplexTypeTools.toString(ct);
    }

    private function isLowercasePrefix(s:String):Bool
        return s.charAt(0).toLowerCase() == s.charAt(0);

    public function transformDef(def:HaxeTypeDefinition) {
        if (def.fields == null)
            return;
        for (field in def.fields) {
            switch field.kind {
                case FFun({params: params}):
                    switch field.expr.def {
                        case EFunction(kind, f):
                            // pass on the params
                            f.params = params;
                            transformer.decls.Function.transformFunction(this, field.name, f);
                        default:
                    }
                default:
            }
            if (field.expr != null)
                transformExpr(field.expr);
        }
    }
    public extern inline overload function exprToString(e:haxe.macro.Expr):String {
        return switch e.expr {
            case EConst(CIdent(s)), EConst(CString(s)):
                s;
            default:
                throw "exprToString not implemented: " + e.expr;
        }
    }
    public extern inline overload function exprToString(e: HaxeExpr):String {
        return switch e.def {
            case EConst(CIdent(s)), EConst(CString(s)):
                s;
            default:
                throw "exprToString not implemented: " + e.def;
        }
    }
}
