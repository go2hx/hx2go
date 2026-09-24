package unit;

function main() {
    // length
    var d:Dynamic = [1, 2, 3];
    assert(d.length == 3);

    // push
    var d:Dynamic = [1, 2, 3];
    assert(d.push(4) == 4);
    assert(d.length == 4);
    assert(d[3] == 4);

    // pop
    var d:Dynamic = [1, 2, 3];
    assert(d.pop() == 3);
    assert(d.length == 2);
    assert(d[1] == 2);

    // shift
    var d:Dynamic = [1, 2, 3];
    assert(d.shift() == 1);
    assert(d.length == 2);
    assert(d[0] == 2);

    // unshift
    var d:Dynamic = [1, 2, 3];
    d.unshift(0);
    assert(d[0] == 0);
    assert(d.length == 4);

    // insert
    var d:Dynamic = [1, 2, 3];
    d.insert(1, 9);
    assert(d[1] == 9);
    assert(d.length == 4);

    // remove
    var d:Dynamic = [1, 2, 3];
    assert(d.remove(2) == true);
    assert(d.remove(99) == false);
    assert(d.length == 2);

    // contains
    var d:Dynamic = [1, 2, 3];
    assert(d.contains(2) == true);
    assert(d.contains(99) == false);

    // indexOf
    var d:Dynamic = [1, 2, 3, 2];
    assert(d.indexOf(2) == 1);
    assert(d.indexOf(99) == -1);

    // lastIndexOf
    var d:Dynamic = [1, 2, 3, 2];
    assert(d.lastIndexOf(2) == 3);
    assert(d.lastIndexOf(99) == -1);

    // concat
    var d:Dynamic = [1, 2, 3];
    var c = d.concat([4, 5]);
    assert(c.length == 5);
    assert(c[4] == 5);
    assert(d.length == 3);

    // copy
    var d:Dynamic = [1, 2, 3];
    var cp = d.copy();
    cp.push(4);
    assert(cp.length == 4);
    assert(d.length == 3);

    // slice
    var d:Dynamic = [1, 2, 3, 4];
    var s = d.slice(1);
    assert(s.length == 3);
    assert(s[0] == 2);
    assert(d.length == 4);

    // splice
    var d:Dynamic = [1, 2, 3, 4];
    var removed = d.splice(1, 2);
    assert(removed.length == 2);
    assert(removed[0] == 2);
    assert(d.length == 2);

    // reverse
    var d:Dynamic = [1, 2, 3];
    d.reverse();
    assert(d[0] == 3);
    assert(d[2] == 1);

    // sort
    var d:Dynamic = [3, 1, 2];
    d.sort(function(a, b) return a - b);
    assert(d[0] == 1);
    assert(d[2] == 3);

    // map
    var d:Dynamic = [1, 2, 3];
    var m = d.map(function(x) return x * 10);
    assert(m[0] == 10);
    assert(m[2] == 30);
    assert(d.length == 3);

    // filter
    var d:Dynamic = [1, 2, 3, 4];
    var f = d.filter(function(x) return x % 2 == 0);
    assert(f.length == 2);
    assert(f[0] == 2);
    assert(f[1] == 4);

    // resize
    var d:Dynamic = [1, 2, 3];
    d.resize(2);
    assert(d.length == 2);

    // join
    var d:Dynamic = [1, 2, 3];
    assert(d.join("-") == "1-2-3");

    // toString
    var d:Dynamic = [1, 2, 3];
    assert(d.toString() == "[1,2,3]");

    // iterator
    var d:Dynamic = [1, 2, 3];
    var it:Iterator<Int> = d.iterator();
    var sum = 0;
    while (it.hasNext()) sum += it.next();
    assert(sum == 6);

    // keyValueIterator
    var d:Dynamic = [10, 20, 30];
    var kv:KeyValueIterator<Int, Int> = d.keyValueIterator();
    var keys = 0;
    var vals = 0;
    while (kv.hasNext()) {
        var p = kv.next();
        keys += p.key;
        vals += p.value;
    }
    assert(keys == 3);
    assert(vals == 60);
}
