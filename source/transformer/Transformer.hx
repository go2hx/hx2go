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
            default:
                var idx = 0;
                HaxeExprTools.iter(e, (le) -> {
                    transformExpr(le, e, idx);
                    idx++;
                });

        }
    }
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

        children.insert(insertPos, {
            t: null,
            specialDef: null,
            def: EVars([
                { name: '_temp_$id', expr: e }
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
}
