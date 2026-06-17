package go.fmt;

@:go.Module({ name: "fmt", imports: ["fmt"] })
extern class Fmt {
    static function println(...v: Dynamic): Void;
}
