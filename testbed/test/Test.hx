package test;
import go.fmt.Fmt;

typedef Sprite = {
    x: Float,
    y: Float
};

class Test {

    public static function cool(): Void {
        var v: Sprite = {
            x: 3,
            y: 5.0
        };

        var q: { x: Dynamic } = v;
        var w: { x: Int } = q;
        var t: Dynamic = q;
        w = t;

        Fmt.println(v, q, w, t);
    }

}
