package go.unicode;

@:go.Type({ name: "SpecialCase", instanceName: "unicode.SpecialCase", imports: ["unicode"] })
extern class SpecialCase {

    @:native("ToLower") function toLower(r: go.Rune): (go.Rune);
    @:native("ToTitle") function toTitle(r: go.Rune): (go.Rune);
    @:native("ToUpper") function toUpper(r: go.Rune): (go.Rune);

}