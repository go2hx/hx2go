package runtime;

@:keep
class HxEnum {
    private static var enums: Array<HxEnum> = [];

    public var name: String;
    public var constructors: Array<HxEnumConstructor> = [];

     public function new(name: String, constructors: Array<HxEnumConstructor>) {
        this.name = name;

        HxEnum.enums.push(this);
    }

     public static function findEnum(name: String): Null<HxEnum> {
        for (e in enums) {
            if (e.name != name) {
                continue;
            }

            return e;
        }

        return null;
    }

    public static function getAllEnums(): Array<HxEnum> {
        return enums.copy();
    }

    /*
    // functions from type stdlib
func CreateEnumIndex(e *Hx_Enum, index int, params *[]any) *Hx_EnumValue {
	var c = (*e.Constructors)[index]
	return &Hx_EnumValue{
		Constructor: c,
		Params:      params, // should be copied as enum isnt mutable, in the runtime this would Array<Dynamic> which you can just call .copy() on
	}
}
    */


    public static function createEnumIndex(e:HxEnum, index:Int, params:Array<Dynamic>):HxEnumValue {
        final c = e.constructors[index];
        final value:HxEnumValue = {
            constructor: c,
            params: params.copy(),
        };
        return value;
    }

}

@:keep
class HxEnumConstructor {
    public var name:String = "";
    public var paramCount:Int = 0;
    public var index:Int = 0;
    public var e:HxEnum = null;
    public function new(name : String, paramCount:Int, e:HxEnum, index:Int) {
        this.name = name;
        this.paramCount = paramCount;
        this.e = e;
        this.index = index;
    }
}

@:keep
@:structInit
class HxEnumValue {
    public var constructor:HxEnumConstructor = null;
    public var params:Array<Dynamic> = [];
    public function new(constructor:HxEnumConstructor, params:Array<Dynamic>) {
        this.constructor = constructor;
        this.params = params;
    }
}