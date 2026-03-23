import runtime.HxEnum.HxEnumValue;

class Type {
    public static function enumConstructor(e:EnumValue):String {
        return cast(e, HxEnumValue).constructor.name;
    }

    public static function enumIndex(e:EnumValue):Int {
        return cast(e, HxEnumValue).constructor.index;
    }

    public static function enumParameters(e:EnumValue):Array<Dynamic> {
        return [];
    }

    public static function getEnumConstructs(e:Enum<Dynamic>):Array<String> {
        return [];
    }

    public static function allEnums<T>(e:Enum<T>):Array<T> {
        throw "not supported";
    }

    public static function createEnumIndex<T>(e:Enum<T>, index:Int, ?params:Array<Dynamic>):T {
        throw "not supported";
    }

    public static function enumEq<T:EnumValue>(a:T, b:T):Bool {
        return false;
    }

    public static function createEnum<T>(e:Enum<T>, constr:String, ?params:Array<Dynamic>):T {
        throw "not supported";
    }

    public static function getEnumName(e:Enum<Dynamic>):String {
        return "";
    }
}