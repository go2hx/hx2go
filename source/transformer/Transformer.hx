package transformer;

import HaxeExpr;
import HaxeExpr.HaxeTypeDefinition;
import HaxeExpr.HaxeTypeDefinition;
import haxe.macro.Expr.TypeDefinition;
import haxe.macro.ComplexTypeTools;
import haxe.macro.Expr;
import transformer.exprs.*;
import translator.TranslatorTools;

@:structInit
class Transformer {
    public var module:Module = null;
    public var def:HaxeTypeDefinition = null;

    public function transformExpr(e:HaxeExpr, ?parent:HaxeExpr, ?parentIdx:Int) {
        if (e == null || e.def == null) {
            return;
        }

        if (parent != null) {
            e.parent = parent;
            e.parentIdx = parentIdx;
        }

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
            case EArrayDecl(values, _):
                transformer.decls.ArrayDecl.transformArray(this, e, values);
            case EArray(e1, e2):
                transformer.exprs.ArrayAccess.transformArrayAccess(this, e, e1, e2);
            case ENew(tpath, params):
                transformer.exprs.New.transformNew(this, e, tpath, params);
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
                transformTypeParams(p.params);

                if (isLowercasePrefix(p.name)) {
                    return;
                }

                final td = module.resolveClass(p.pack, p.name, module.path);
                if (td == null) {
                    trace('null td for transformComplexType', p);
                    return;
                }

                handleCoreTypeName(p, td.name);
                processTypeMetadata(p, td);

            default:
        }
    }

    function transformTypeParams(params:Array<TypeParam>) {
        if (params == null) {
            return;
        }

        for (param in params) {
            switch param {
                case TPType(t2):
                    transformComplexType(t2);
                default:
            }
        }
    }

    function handleCoreTypeName(p:TypePath, tdName:String) {
        p.name = switch tdName {
            case "Unknown": "any";
            case _: p.name;
        }
    }

    function processTypeMetadata(p:TypePath, td:HaxeTypeDefinition) {
        for (meta in td.meta()) {
            switch meta.name {
                case ":coreType":
                    processCoreType(p, td.name);

                case ":go.TypeAccess":
                    processStructAccess(p, meta);
            }
        }
    }

    function processCoreType(p:TypePath, tdName:String) {
        p.pack = [];
        p.name = switch tdName {
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
            case "go.Tuple": {
                var struct: Array<{ name: String, type: String }> = [];

                switch p.params[0] {
                    case TPType(ct):
                        switch ct {
                            case TAnonymous(fields):
                                for (f in fields) {
                                    var fct = switch f.kind {
                                        case FVar(fct): fct;
                                        case _: null;
                                    }

                                    transformComplexType(fct);

                                    var ftp = switch (fct) {
                                        case TPath(tp): tp;
                                        case _: null;
                                    }

                                    struct.push({ name: toPascalCase(f.name), type: ftp.name });
                                }

                            case _: null;
                        }
                    case _: null;
                }

                'struct { ${struct.map(f -> '${f.name} ${f.type}').join('; ')} }';
            }
            case "Bool": "bool";
            case "Dynamic": "any";
            case "Array": '*[]${transformComplexTypeParam(p.params, 0)}';
            case "String": "string";
            case "Null": '${transformComplexTypeParam(p.params, 0)}'; // TODO: implement Null<T>, currently just bypass
            case _: p.name; // ignore coreType
        }

        p.params = switch tdName {
            case "go.Slice" | "go.Nullable" | "go.Pointer" | "Null" | "Array": [];
            case _: p.params; // ignore coreType
        }
    }

    function processStructAccess(p:TypePath, meta:MetadataEntry) {
        var fields = switch meta.params[0].expr {
            case EObjectDecl(fields): fields;
            case _: return;
        }

        for (field in fields) {
            switch field.field {
                case "name":
                    p.name = exprToString(field.expr);
                    p.pack = [];
                    p.params = [];

                case "imports":
                    var values = switch field.expr.expr {
                        case EArrayDecl(values): values;
                        case _: continue;
                    }

                    for (v in values) {
                        def.addGoImport(exprToString(v));
                    }

                case _:
            }
        }
    }

    public function transformComplexTypeParam(params:Array<TypeParam>, idx:Int) {
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

    private function isLowercasePrefix(s:String):Bool {
        return s.charAt(0).toLowerCase() == s.charAt(0);
    }

    public function transformDef(def:HaxeTypeDefinition) {
        if (def.fields == null) {
            return;
        }

        for (field in def.fields) {
            switch field.kind {
                case FFun({params: params}):
                    switch field.expr.def {
                        case EFunction(kind, f):
                            f.params = params;
                            transformer.decls.Function.transformFunction(this, field.name, f);
                        default:
                    }
                default:
            }

            if (field.expr != null) {
                transformExpr(field.expr);
            }
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

    public extern inline overload function exprToString(e:HaxeExpr):String {
        return switch e.def {
            case EConst(CIdent(s)), EConst(CString(s)):
                s;
            default:
                throw "exprToString not implemented: " + e.def;
        }
    }
}