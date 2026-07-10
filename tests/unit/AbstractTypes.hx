package unit;


private abstract Foo(Int) from Int {
    public function log(): Int {
        return this;
    }
}

private abstract Bar<T>(Array<T>) from Array<T> to Array<T> {
    public function length(): Int {
        var count = 0;
        for (_ in this) {
            count++;
        }
        return count;
    }

    public function toArray(): Array<T> {
        return this;
    }
}

function main() {
    var arr: Array<Int> = [1, 2, 3];
    var abs1: Bar<Int> = arr;
    var abs2: Bar<Foo> = abs1;
    assert(abs2.length() == 3);

    var arr2 = abs2.toArray();
    assert(arr2.length == 3);
    assert((arr2[0] : Foo).log() == 1);
}
