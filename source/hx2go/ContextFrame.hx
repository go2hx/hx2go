package hx2go;

import hx2go.hxb.Typed.HxbTypedExpr;
import hx2go.hxb.HxbModuleType;

class ContextFrame {

    public var passes: Array<ICompilerPass>;
    public var pending: Map<ICompilerPass, Array<HxbTypedExpr>>;
    public var currentPassIndex: Int;
    public var type: HxbModuleType;

    public function new(passes: Array<ICompilerPass>, type: HxbModuleType) {
        this.passes = passes;
        this.type = type;
        this.pending = [];
        this.currentPassIndex = -1;

        for (p in passes) {
            this.pending[p] = [];
        }
    }

}
