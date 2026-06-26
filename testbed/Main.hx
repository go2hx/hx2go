import go.fmt.Fmt;
import haxe.iterators.ArrayIterator;

typedef IVec2 = {
    x: Int,
    y: Int
};

typedef Vec2 = {
    x: Float,
    y: Float
};

typedef IVec3 = {
    x: Int,
    y: Int,
    z: Int
};

typedef Vec3 = {
    x: Float,
    y: Float,
    z: Float
};

class Main {

    public static function main(): Void {
        var anon = {
            x: 3,
            y: 5,
            nest: {
                cool: true,
                v: "Cool!"
            }
        };

        var anon_dyn: Dynamic = anon;
        anon_dyn.x = 100;

        Fmt.println(anon, anon.x + anon.y);

        var vec: IVec3 = {
            x: 10,
            y: 100,
            z: 1000
        };

        Fmt.println(vec);

        var v1: Null<Int> = null;
        var v2: Int = 5;
        var nulled = {
            x: null,
            y: v1,
            z: v2
        };

        var nulled_dyn: Dynamic = nulled;
        nulled_dyn.z = null;

        Fmt.println(v1);
        Fmt.println(v2);
        Fmt.println(nulled.x);
        Fmt.println(nulled.y);
        Fmt.println(nulled.z);
        Fmt.println(nulled);

        trace("A");
        trace("A", "B", "C");

        var null_int: Null<Int> = null;
        var null_float: Null<Float> = null_int;
        Fmt.println(null_int, null_float);

        var arr = [1, 2, 3];
        var iter = new ArrayIterator(arr);

        while (iter.hasNext()) {
            trace(iter.next());
        }

        // TODO: test dynamic set, test dynamic unop, test dynamic field unop, test dyanmic opassignop, test dynamic field opassignop
    }

}