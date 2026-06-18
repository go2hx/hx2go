import go.fmt.Fmt;
import go.time.Time;

class Sys {

    public inline static function println(v: Dynamic): Void {
        Fmt.println(v);
    }

    public inline static function print(v: Dynamic): Void {
        Fmt.print(v);
    }

    public inline static function sleep(seconds: Float): Void {
        Time.sleep(seconds * 1000 * Time.millisecond);
    }

}