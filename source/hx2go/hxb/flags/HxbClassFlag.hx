package hx2go.hxb.flags;

enum abstract HxbClassFlag(Int) from Int to Int {
    var CExtern = 1 << 0;
    var CFinal = 1 << 1;
    var CInterface = 1 << 2;
    var CAbstract = 1 << 3;
    var CFunctionalInterface = 1 << 4;
    var CUsed = 1 << 5;
    var CExcluded = 1 << 6;
}
