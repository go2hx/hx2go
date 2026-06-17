package hx2go.preprocessor;

import hx2go.hxb.Typed.HxbTypedExpr;

@:structInit
class Scope {

    public var lastValidBlock: HxbTypedExpr = null;

    public function copy(): Scope {
        return {
            lastValidBlock: lastValidBlock
        };
    }

}
