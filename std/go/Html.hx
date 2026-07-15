package go;

@:go.Type({ name: "html", instanceName: "html.html", imports: ["html"] })
extern class Html {

    @:native("EscapeString") static function escapeString(s: String): String;
    @:native("UnescapeString") static function unescapeString(s: String): String;

}