package go.text;

@:go.Type({ name: "tabwriter", instanceName: "tabwriter.tabwriter", imports: ["text/tabwriter"] })
extern class Tabwriter {

    @:native("AlignRight") static var AlignRight: go.GoUInt;
    @:native("Debug") static var Debug: go.GoUInt;
    @:native("DiscardEmptyColumns") static var DiscardEmptyColumns: go.GoUInt;
    @:native("Escape") static var Escape: go.Rune;
    @:native("FilterHTML") static var FilterHTML: go.GoUInt;
    @:native("StripEscape") static var StripEscape: go.GoUInt;
    @:native("TabIndent") static var TabIndent: go.GoUInt;

    @:native("NewWriter") static function newWriter(output: go.io.Writer, minwidth: go.GoInt, tabwidth: go.GoInt, padding: go.GoInt, padchar: go.Byte, flags: go.GoUInt): go.Pointer<go.text.tabwriter.Writer>;

}