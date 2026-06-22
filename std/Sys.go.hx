import go.fmt.Fmt;
import go.time.Time;

class Sys {

    public static function println(v: Dynamic): Void {
        Fmt.println(Std.string(v));
    }

    public static function print(v: Dynamic): Void {
        Fmt.print(Std.string(v));
    }

    public static function sleep(seconds: Float): Void {
        Time.sleep(seconds * 1000 * Time.millisecond);
    }

}