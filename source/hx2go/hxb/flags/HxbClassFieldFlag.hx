package hx2go.hxb.flags;

enum abstract HxbClassFieldFlag(Int) from Int to Int {
    var CfPublic = 1 << 0;
    var CfStatic = 1 << 1;
    var CfExtern = 1 << 2;
    var CfFinal = 1 << 3;
    var CfModifiesThis = 1 << 4;
    var CfOverride = 1 << 5;
    var CfAbstract = 1 << 6;
    var CfOverload = 1 << 7;
    var CfImpl = 1 << 8;
    var CfEnum = 1 << 9;
    var CfGeneric = 1 << 10;
    var CfDefault = 1 << 11;
    var CfPostProcessed = 1 << 12;
    var CfUsed = 1 << 13;
    var CfMaybeUsed = 1 << 14;
    var CfNoLookup = 1 << 15;
    var CfAbstractConstructor = 1 << 16;
}