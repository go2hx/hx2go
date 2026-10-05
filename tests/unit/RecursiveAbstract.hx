package unit;

private abstract Rec(Array<Rec>) from Array<Rec> {
    public function first():Rec return this[0];
    public function size():Int return this.length;
}

function main() {
    var leaf:Rec = [];
    var root:Rec = [leaf];
    assert(root.first().size() == 0);
}
