package transformer.exprs;

import HaxeExpr;
import transformer.Transformer;
import haxe.macro.Expr;

function transformUnop(t:Transformer, e0: HaxeExpr, op: Unop, postFix: Bool, e1: HaxeExpr) {
    // iterate over unop
    t.iterateExpr(e0);

    // ignore if not OpIncrement or OpDecrement
    if (op != OpIncrement && op != OpDecrement) {
        return;
    }

    // ignore if parent is a block
    if (e0.parent != null) {
        switch (e0.parent.def) {
            case EBlock(_): return;
            case _: null;
        }
    }

    // we first copy over some information needed for temporaries
    e1.parent = e0.parent;
    e1.parentIdx = e0.parentIdx;

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
    var e2: HaxeExpr = { t: null, specialDef: null, def: EBinop(binop, e1, one), parent: e0.parent, parentIdx: e0.parentIdx };
    var e3: HaxeExpr = { t: null, specialDef: null, def: EBinop(OpAssignOp(binop), e1, one) };

    // extract to temporary
    var tmp = t.createTemporary(postFix ? e1 : e2, null, e3);

    // we replace the UnOp with the proper identifier
    e0.def = tmp.def;
}
