package go.fmt;

@:go.Module({ name: "fmt", imports: ["fmt"] })
extern class Fmt {
    static function println(e: Dynamic): Void;
}
