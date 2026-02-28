package go.os;
import go.Tuple;
import go.Result;
import go.Error;

// TODO implemnt more of os
@:go.TypeAccess({name: "os", imports: ["os"]})
extern class Os {
    public static var Args:go.Slice<String>;

    @:go.Tuple("cwd", "err") static function getwd(): Tuple<{ cwd: String, err: Error }>;

    static function chdir(dir:String):Error;

    static function getenv(key:String):String;

    static function exit(code:Int):Void;
}



