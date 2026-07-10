package go;

extern class Syntax {

    /**
       Emits raw go code, with support for code interpolation.
       @param template The template string to use, using {n} to use the parameters.
       @param parameters The parameters to use.
    **/
    public extern static function code<T>(template: String, ...parameters: Dynamic): T;

    /**
       Emits a defer in go, captures local variables and you can use as many statements as you desire.
    **/
    public extern static function defer(code: Void -> Void): Void;

    /**
       Emits a goroutine in go, captures local variables and you can use as many statements as you desire.
    **/
    public extern static function go(code: Void -> Void): Void;

    /**
       Type switch in go
    **/
    public extern static function type(v: Dynamic): Dynamic;

}
