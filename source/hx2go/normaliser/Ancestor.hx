package hx2go.normaliser;

import hx2go.hxb.Typed.HxbTypedExpr;

@:structInit
class Ancestor {
    public var node: HxbTypedExpr; // parent
    public var scope: Scope;       // active scope for that object
    public var up: Null<Ancestor>; // ancestor object of parent, so ancestor.up.node would be 2 levels up instead of 1
}
