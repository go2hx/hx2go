package go.os;

import go.Result;
import go.Error;

// TODO implemnt more of os
@:coreType
@:notNull
@:runtimeValue
@:go.TypeAccess({name: "os", imports: ["os"]})
extern class Os {
    public static var Args:go.Slice<String>;

    static function getwd():Result<String, Error>;
    static function chdir(dir:String):Error;

    static function getenv(key:String):String;

    static function exit(code:Int):Void;
}
