import haxe.iterators.ArrayIterator;
import go.fmt.Fmt;

typedef Vec2 = {
    x: Float,
    y: Float
};

typedef Vec3 = {
    x: Float,
    y: Float,
    z: Float
};

typedef IVec2 = {
    x: Int,
    y: Int
};

typedef IVec3 = {
    x: Int,
    y: Int,
    z: Int
};

typedef Mat2 = {
    m0: Vec2,
    m1: Vec2,
};

typedef Mat3 = {
    m0: Vec3,
    m1: Vec3,
    m2: Vec3
};

class Main {

    public static function main(): Void {
        trace("A");
        trace("A", "B");

        var test: Array<Int> = [1, 2, 3];
        var iter = test.iterator();
        printAll(iter);

        var test_dyn_arr: Array<Dynamic> = test;
        var test_dyn_obj: Dynamic = test;
        Fmt.println(test_dyn_arr, test_dyn_obj);

        var test_null_dyn_arr: Null<Array<Dynamic>> = test;
        var test_dyn_null_arr: Array<Null<Dynamic>> = test;
        var test_null_dyn_obj: Null<Dynamic> = test;
        Fmt.println(test_null_dyn_arr, test_dyn_null_arr, test_null_dyn_obj);

        Fmt.println(test[0], test.length);
        Fmt.println(test_dyn_arr[0], test_dyn_arr.length);
        Fmt.println(test_dyn_obj[0], test_dyn_obj.length);
        Fmt.println(test_null_dyn_arr[0], test_null_dyn_arr.length);
        Fmt.println(test_dyn_null_arr[0], test_dyn_null_arr.length);
        Fmt.println(test_null_dyn_obj[0], test_null_dyn_obj.length);

        var arr_mat3: Array<Mat3> = [
            {
                m0: { x: 1, y: 0, z: 0 },
                m1: { x: 0, y: 1, z: 0 },
                m2: { x: 0, y: 0, z: 1 }
            }
        ];

        var obj_dyn: Dynamic = arr_mat3;
        var arr_dyn: Array<Dynamic> = arr_mat3;
        var arr_mat2: Array<Mat2> = arr_mat3;

        Fmt.println(arr_mat3);
        Fmt.println(arr_mat2);
        Fmt.println(obj_dyn);
        Fmt.println(arr_dyn);
        Fmt.println(arr_dyn[0].m0.x);
        Fmt.println(obj_dyn[0].m1.y);

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

        dyn_prim_i++;
        ++dyn_prim_i;
        dyn_prim_i += 10;

        var values: Dynamic  = {
            prim_b: false,
            prim_i: 5,
            null_b: (null : Null<Bool>),
            null_i: (null: Null<Int>)
        };

        Fmt.println(-values.prim_i, -values.null_i);
        Fmt.println(!values.prim_b, !values.null_b);
        Fmt.println(values);

        values.prim_i++;
        values.prim_i += 10;
        values.null_b = true;

        Fmt.println(values);

        Fmt.println(values.prim_i);
        Fmt.println(values.prim_i++);
        Fmt.println(++values.prim_i);
        Fmt.println(values.prim_i += 10);

        var x: Int = 3;
        var y: Int = 5;
        var x_null: Null<Int> = x;
        var y_null: Null<Int> = y;

        var test_a = x + y_null;
        var test_b = x_null + y;
        var test_c = x_null + y_null;
        var test_d = x + y;

        var x: Int = 0;
        var x_null: Null<Int> = x;
        Sys.println('x_null is null? ' + (x_null == null));
        var x_int: Int = x;
        Sys.println('x value was ' + x + ' now ' + x_int);
        x_null = null;
        Sys.println('nullable x is ' + x_null);
        x_int = x_null;
        Sys.println('x value is now ' + x_int);

        var y: Int = 5;
        var y_null: Null<Int> = y;
        Sys.println('y_null is null? ' + (y_null == null));
        Sys.println('nullable y is ' + y_null);

        var y_float: Float = y_null;
        Sys.println('nullable y casted to float is ' + y_float);
        var y_null_float: Null<Float> = y_null;
        Sys.println('nullable y casted to nullable float is ' + y_null_float);

        var y_int: Int = y;
        Sys.println('y value is ' + y_int);
        y_null = null;
        Sys.println('y_null is null? ' + (y_null == null));
        Sys.println('nullable y is ' + y_null);
        y_int = y_null;
        Sys.println('y value is ' + y_int);

        var z: Int = 3;
        var z_null: Null<Int> = z;
        var z_dyn: Dynamic = z_null;
        Sys.println('z_dyn is null? ' + (z_dyn == null));

        var z_dyn_int: Int = z_dyn;
        Sys.println('z_dyn_int value ' + z_dyn_int);

        var z_dyn_null_int: Null<Int> = z_dyn;
        Sys.println('z_dyn_null_int value ' + z_dyn_null_int);
        Sys.println('z_dyn_null_int is null? ' + (z_dyn_null_int == null));

        z_null = null;
        z_dyn = z_null;
        Sys.println('z_dyn is null? ' + (z_dyn == null));

        z_dyn_int = z_dyn;
        Sys.println('z_dyn_int value ' + z_dyn_int);

        z_dyn_null_int = z_dyn;
        Sys.println('z_dyn_null_int value ' + z_dyn_null_int);
        Sys.println('z_dyn_null_int is null? ' + (z_dyn_null_int == null));
    }

    public static function printAll<T>(iter: ArrayIterator<T>): Void {
        while (iter.hasNext()) {
            trace(iter.next());
        }
    }

}