import go.Fmt;
import go.time.Time;
import go.Syntax;

class Sys {

    public static function println<T>(v:T): Void
        Fmt.println(v);

    public static function print<T>(v:T): Void
        Fmt.print(v);

    public static function sleep(seconds: Float): Void
        return Time.sleep(Time.second * seconds);

}