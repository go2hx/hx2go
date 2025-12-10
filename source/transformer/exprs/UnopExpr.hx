package transformer.exprs;

import HaxeExpr;
import transformer.Transformer;
import haxe.macro.Expr;

function transformUnop(t:Transformer, e: HaxeExpr, op: Unop, postFix: Bool, e1: HaxeExpr) {
    // iterate over unop
    t.iterateExpr(e);

    // ignore if not OpIncrement or OpDecrement
    if (op != OpIncrement && op != OpDecrement) {
        return;
    }

    // ignore if parent is a block
    var inBlock = false;
    if (e.parent != null) {
        switch (e.parent.def) {
            case EBlock(_) if (postFix): return;
            case EBlock(_): inBlock = true;
            case _: null;
        }
    }

    // we first copy over some information needed for temporaries
    e1.parent = e.parent;
    e1.parentIdx = e.parentIdx;

    // convert Unop to Binop
    var binop: Binop = switch(op) {
        case OpIncrement: OpAdd;
        case OpDecrement: OpSub;
        case _: {
            trace('invalid unop to binop');
            null;
        }
    }

    // create the required expressions
    var one: HaxeExpr = { t: null, specialDef: null, def: EConst(CInt('1')) };
    var e2: HaxeExpr = { t: null, specialDef: null, def: EBinop(binop, e1, one), parent: e.parent, parentIdx: e.parentIdx };
    var e3: HaxeExpr = { t: null, specialDef: null, def: EBinop(OpAssignOp(binop), e1, one) };

    // extract to temporary
    if (inBlock) e.def = e3.def;
    else {
        var tmp = t.createTemporary(postFix ? e1 : e2, null, e3);
        e.def = tmp.def;
    }
}
