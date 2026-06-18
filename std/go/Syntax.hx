package go;

extern class Syntax {
    public extern static function code<T>(template: String, ...parameters: Dynamic): T;
    public extern static function defer(code: Void -> Void): Void;
}
