package go.unicode;

/**
    SpecialCase represents language-specific case mappings such as Turkish.
    Methods of SpecialCase customize (by overriding) the standard mappings.
**/
@:go.Type({ name: "SpecialCase", instanceName: "unicode.SpecialCase", imports: ["unicode"] })
extern class SpecialCase {

    /**
        ToLower maps the rune to lower case giving priority to the special mapping.
    **/
    @:native("ToLower") function toLower(r: go.Rune): (go.Rune);
    /**
        ToTitle maps the rune to title case giving priority to the special mapping.
    **/
    @:native("ToTitle") function toTitle(r: go.Rune): (go.Rune);
    /**
        ToUpper maps the rune to upper case giving priority to the special mapping.
    **/
    @:native("ToUpper") function toUpper(r: go.Rune): (go.Rune);

}