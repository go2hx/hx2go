package transformer;

import HaxeExpr;
import HaxeExpr.HaxeTypeDefinition;
import HaxeExpr.HaxeTypeDefinition;
import haxe.macro.Expr.TypeDefinition;
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
    public var tempId:Int = 0;
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
            case EUnop(op, postFix, e1):
                UnopExpr.transformUnop(this, e, op, postFix, e1);
            case EWhile(cond, body, norm):
                While.transformWhile(this, e, cond, body, norm);
            case EIf(cond, branchTrue, branchFalse):
                If.transformIf(this, e, cond, branchTrue, branchFalse);
            case EVars(vars):
                VarDeclarations.transformVarDeclarations(this, e, vars);
            case EBinop(op, e1, e2):
                BinopExpr.transformBinop(this, e, op, e1, e2);
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
                    trace('td is null in transformComplexType for' + ct);
                    return;
                }

                for (meta in td.meta()) {
                    switch meta.name {
                        case ":coreType":
                            p.pack = [];
                            p.name = switch td.name {
                                case "go.Float32", "Single": "float32";
                                case "Float": "float64";
                                case "go.Int32", "Int": "int32";
                                case "go.Int64": "int64";
                                case "go.Int16": "int16";
                                case "go.Int8": "int8";
                                case "Bool": "bool";
                                // TODO handle UInt types
                                default:
                                    trace("unhandled coreType: " + td.name);
                                    "#UNKNOWN_TYPE";
                            }
                    }
                }
            default:
        }
    }
    private function isLowercasePrefix(s:String):Bool
        return s.charAt(0).toLowerCase() == s.charAt(0);
    public function transformDef(def:HaxeTypeDefinition) {
        if (def.fields == null)
            return;
        for (field in def.fields) {
            switch field.kind {
                case FFun(_):
                    if (field?.expr?.def == null)
                        field.expr = {
                            t: null,
                            specialDef: null,
                            def: EBlock([]),
                        };
                default:
            }
            if (field.expr != null)
                transformExpr(field.expr);
        }
    }
    public function findOuterBlock(e:HaxeExpr): { pos: Int, of: Null<HaxeExpr> } {
        var parent: HaxeExpr = e;
        var pos: Int = 0;

        while (parent != null) {
            switch (parent?.def) {
                case EBlock(_): break;
                case _:
                    pos = parent.parentIdx;
                    parent = parent.parent;
            }
        }

        return { pos: pos, of: parent };
    }
    // takes the type as a string and transforms it into CheckType ($expr : $ct)
    public function transformTypeConversion(t:String, e:HaxeExpr) {
        final ct = HaxeExprTools.stringToComplexType(t);
        transformComplexType(ct);
        e.def = ECheckType(e.copy(), ct);
    }
    public function createTemporary(e:HaxeExpr, ?pre:HaxeExpr, ?post: HaxeExpr): HaxeExpr {
        var expr: HaxeExpr = {
            t: null,
            specialDef: null,
            def: EConst(CIdent("#FAILED_TEMP"))
        };

        var block = findOuterBlock(e);
        if (block.of == null) {
            trace('could not create temporary: no outer block');
            return expr;
        }

        var children: Array<HaxeExpr> = switch (block.of.def) {
            case EBlock(x): x;
            case _: null;
        }

        if (children == null) {
            trace('could not create temporary: children should not be null');
            return expr;
        }

        var id = tempId++;
        expr.def = EConst(CIdent('_temp_$id'));

        var insertPos = block.pos;
        var insertCount = 0;

        if (pre != null) {
            children.insert(insertPos, pre);
            insertPos++;
            insertCount++;
        }

        var path: Array<String>;
        if (e.t != null) path = e.t.split(".");
        else path = [];

        var typeModule = path.pop();
        children.insert(insertPos, {
            t: e.t,
            specialDef: null,
            def: EVars([
                { name: '_temp_$id', expr: e, type: path.length > 0 ? TPath({ pack: path, name: typeModule }) : null }
            ])
        });

        insertPos++;
        insertCount++;

        if (post != null) {
            children.insert(insertPos, post);
            insertCount++;
        }

        for (i in (block.pos + insertCount)...children.length) {
            if (children[i].parentIdx >= block.pos) {
                children[i].parentIdx += insertCount;
            }
        }

        return expr;
    }
    public function ensureBlock(e:HaxeExpr):HaxeExpr {
        if (e == null) {
            return null;
        }

        return switch (e.def) {
            case EBlock(_): e;
            case _: { t: null, specialDef: null, def: EBlock([e]) };
        }
    }
}
