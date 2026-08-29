package go;

/**
    Package html provides functions for escaping and unescaping HTML text.
**/
@:go.Type({ name: "html", instanceName: "html.html", imports: ["html"] })
extern class Html {

    /**
        EscapeString escapes special characters like "<" to become "&lt;". It
        escapes only five such characters: <, >, &, ' and ".
        [UnescapeString](EscapeString(s)) == s always holds, but the converse isn't
        always true.
    **/
    @:native("EscapeString") static function escapeString(s: String): (String);
    /**
        UnescapeString unescapes entities like "&lt;" to become "<". It unescapes a
        larger range of entities than [EscapeString] escapes. For example, "&aacute;"
        unescapes to "á", as does "&#225;" and "&#xE1;".
        UnescapeString([EscapeString](s)) == s always holds, but the converse isn't
        always true.
    **/
    @:native("UnescapeString") static function unescapeString(s: String): (String);

}