package go;

extern class Syntax {

    /**
       Emits raw Go code, with support for code interpolation.
       @param template The template string to use, using {n} to use the parameters.
       @param parameters The parameters to use.
    **/
    public extern static function code<T>(template: String, ...parameters: Dynamic): T;

    /**
       Emits a defer in Go, captures local variables and you can use as many statements as you desire.
    **/
    public extern static function defer(code: Void -> Void): Void;

    /**
       Emits a goroutine in Go, captures local variables and you can use as many statements as you desire.
    **/
    public extern static function go(code: Void -> Void): Void;

    /**
      Emits a select statement in Go, create cases with Syntax.Select.send(chan, (v) -> {}).
    **/
    public extern static function select(...cases:Select): Void;

}

extern class Select {
   public extern static function receive<T>(chan:ReceiveChan<T>, f: Dynamic):Select;
   public extern static function send<T>(chan:SendChan<T>, f: Dynamic):Select;
   public extern static function defaultCase<T>(f: Dynamic):Select;
   private function new();
}
