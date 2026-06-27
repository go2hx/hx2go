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

        var prim_i: Int = 5;
        var dyn_prim_i: Dynamic = prim_i;
        var prim_b: Bool = false;
        var dyn_prim_b: Dynamic = prim_b;
        var null_i: Null<Int> = null;
        var dyn_null_i: Dynamic = null_i;
        var null_b: Null<Bool> = null;
        var dyn_null_b: Dynamic = null_b;

        Fmt.println(-dyn_prim_i, -dyn_null_i);
        Fmt.println(!dyn_prim_b, !dyn_null_b);

        var values = {
            prim_b: false,
            prim_i: 5,
            null_b: (null : Null<Bool>),
            null_i: (null: Null<Int>)
        };

        Fmt.println(-values.prim_i, -values.null_i);
        Fmt.println(!values.prim_b, !values.null_b);
        Fmt.println(values);

        // TODO: test dynamic field unop, test dyanmic opassignop, test dynamic field opassignop
    }

}