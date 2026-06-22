package go.fmt;

@:go.Type({ name: "fmt", imports: ["fmt"] })
extern class Fmt {
    static function println(...v: Dynamic): Void;
    static function print(...v: Dynamic): Void;
    static function sprintf(template: String, ...params: Dynamic): String;
}
