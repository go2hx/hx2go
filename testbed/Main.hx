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
    }

}