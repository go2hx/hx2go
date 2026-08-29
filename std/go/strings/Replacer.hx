package go.strings;

/**
    Replacer replaces a list of strings with replacements.
    It is safe for concurrent use by multiple goroutines.
**/
@:structInit
@:go.Type({ name: "Replacer", instanceName: "strings.Replacer", imports: ["strings"] })
extern class Replacer {

    /**
        Replace returns a copy of s with all replacements performed.
    **/
    @:native("Replace") function replace(s: String): (String);
    /**
        WriteString writes s to w with all replacements performed.
    **/
    @:native("WriteString") function writeString(w: go.io.Writer, s: String): (go.Result<go.GoInt>);

}