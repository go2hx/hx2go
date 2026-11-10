package go;

@:noClosure
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
      Emits a `select` statement in Go. Build its cases with `Select.receive`,
      `Select.send` and `Select.defaultCase`, e.g.

      ```haxe
      Syntax.select(
          Select.receive(ch, (v) -> trace(v)),
          Select.send(out, 1, () -> {}),
          Select.defaultCase(() -> {})
      );
      ```

      Case bodies are added as closures, so a `return`,
      `break` or `continue` inside a case does not apply to the outer function/loop/select.
    **/
    public extern static function select(...cases: Select): Void;


    /**
      Emits a `switch v := x.(type)` type switch in Go. Build its cases with
      `TypeSwitch.typeCase`, and `TypeSwitch.defaultCase`

      ```haxe
      Syntax.typeSwitch(value,
          TypeSwitch.typeCase((v: go.Error) -> trace(v)),
          TypeSwitch.defaultCase((v: Dynamic) -> {})
      );
      ```

      Case bodies are added as closures, so a `return`,
      `break` or `continue` inside a case does not apply to the outer function/loop/switch.
    **/
    public extern static function typeSwitch<T>(value: T, ...cases: TypeSwitch): Void;

}

extern class Select {
    /** A receive case `case v := <-chan:`; the callback receives the value (name it `_` to ignore). **/
    public extern static function receive<T>(chan: ReceiveChan<T>, f: T -> Void): Select;

    /** A send case `case chan <- value:`. **/
    public extern static function send<T>(chan: SendChan<T>, value: T, f: Void -> Void): Select;

    /** The `default:` case, taken when no other case is ready. **/
    public extern static function defaultCase(f: Void -> Void): Select;

    private function new();
}


extern class TypeSwitch {
    /** A type case 'case T:` if you are using Go extern types and need `case *T:` use go.Pointer<T>. Null<T> is not supported**/
    public extern static function typeCase<T>(f: T -> Void): TypeSwitch;

    /** The `default:` case; the callback receives the value at its interface type. **/
    public extern static function defaultCase<T>(f: T -> Void): TypeSwitch;

    private function new();
}