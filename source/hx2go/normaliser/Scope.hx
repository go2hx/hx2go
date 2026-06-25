package hx2go.normaliser;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.Typed.HxbTypedExprDef;
import hx2go.hxb.Typed.HxbVar;
import hx2go.hxb.Typed.HxbVarKind;
import hx2go.hxb.Typed.HxbVarOrigin;
import haxe.runtime.Copy;
import hx2go.hxb.HxbType;

@:structInit
class Scope {

    public var lastValidBlock: HxbTypedExpr = null;
    public var variableAliases: Map<String, String> = [];
    public var variableIterations: Map<String, Int> = [];
    public var tmpId: Int = 0;

    public function temp(before: HxbTypedExpr, expr: HxbTypedExpr, preprocessor: Normaliser, scope: Scope, ancestor: Ancestor, ?explicitType: HxbType): HxbTypedExpr {
        var varInfo: HxbVar = {
            id: -1,
            kind: VUser(TVOLocalVariable),
            flags: 0,
            meta: [],
            pos: null,
            name: '_hx_tmp_${tmpId++}',
            type: explicitType ?? expr.t
        };

        scope.insert(
            before,
            new HxbTypedExpr(TVar(varInfo, Copy.copy(expr)), null, null),
            preprocessor,
            scope,
            ancestor
        );

        return new HxbTypedExpr(TLocal(varInfo), explicitType ?? expr.t, expr?.pos);
    }

    public function insert(before: HxbTypedExpr, expr: HxbTypedExpr, preprocessor: Normaliser, scope: Scope, ancestor: Ancestor): Void {
        var stmt = ancestor;
        var parent = ancestor;

        while (parent != null && parent.node != lastValidBlock) {
            stmt = parent;
            parent = parent.up;
        }

        if (parent == null) {
            return;
        }

        var into = switch parent.node.expr {
            case TBlock(x): x;
            case _: null;
        }

        if (into == null) {
            return;
        }

        var anchor = stmt != parent ? stmt.node : before;
        var at = into.indexOf(anchor);

        into.insert(at < 0 ? into.length : at, expr);

        preprocessor.processExpr(expr, parent.scope, parent);
    }

    public function hoist(exprs: Array<HxbTypedExpr>, preprocessor: Normaliser, scope: Scope, ancestor: Ancestor): HxbTypedExpr {
        var last = exprs.pop();

        for (e in exprs) {
            insert(last, e, preprocessor, scope, ancestor);
        }

        preprocessor.processExpr(last, scope, ancestor);

        return last;
    }

    public function getLocal(v: HxbVar): HxbTypedExprDef {
        return TLocal({
            name: variableAliases[v.name] ?? v.name,
            id: v.id,
            kind: v.kind,
            flags: v.flags,
            meta: v.meta,
            pos: v.pos,
            type: v.type,
            extra: v.extra
        });
    }

    public function defineLocal(v: HxbVar, expr: HxbTypedExpr): HxbTypedExprDef {
        var iter = variableIterations[v.name] != null ? variableIterations[v.name] + 1 : 0;
        var name = iter == 0 ? v.name : 'tmp_${v.name}_${iter}';

        variableIterations.set(v.name, iter);
        variableAliases.set(v.name, name);

        return TVar({
            name: name,
            id: v.id,
            type: v.type,
            kind: v.kind,
            flags: v.flags,
            meta: v.meta,
            pos: v.pos,
            extra: v.extra
        }, expr);
    }

    public function copy(): Scope {
        return {
            lastValidBlock: lastValidBlock,
            variableAliases: variableAliases.copy(),
            variableIterations: variableIterations.copy(),
            tmpId: tmpId
        };
    }

}
