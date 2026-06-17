package hx2go.preprocessor;

import hx2go.hxb.Typed.HxbTypedExpr;

@:structInit
class Ancestor {
    public var node: HxbTypedExpr; // parent
    public var indexInParent: Int; // at what idx is child located
    public var up: Null<Ancestor>; // ancestor object of parent, so ancestor.up.node would be 2 levels up instead of 1
}
