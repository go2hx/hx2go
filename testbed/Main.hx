import go.fmt.Fmt;

typedef IVec2 = {
    x: Int,
    y: Int
}

typedef Vec2 = {
    x: Float,
    y: Float
}

typedef IVec3 = {
    x: Int,
    y: Int,
    z: Int
}

typedef Vec3 = {
    x: Float,
    y: Float,
    z: Float
}

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

        var v: IVec3 = {
            x: 10,
            y: 100,
            z: 1000
        };

        var f: IVec2 = v;

        Fmt.println(v, f);

        trace("A");
        trace("A", "B", "C");
    }

}