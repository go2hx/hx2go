package go.text;

@:go.Type({ name: "tabwriter", instanceName: "tabwriter.tabwriter", imports: ["text/tabwriter"] })
extern class Tabwriter {

    @:native("AlignRight") static var alignRight: go.GoUInt;
    @:native("Debug") static var debug: go.GoUInt;
    @:native("DiscardEmptyColumns") static var discardEmptyColumns: go.GoUInt;
    @:native("Escape") static var escape: go.Rune;
    @:native("FilterHTML") static var filterHTML: go.GoUInt;
    @:native("StripEscape") static var stripEscape: go.GoUInt;
    @:native("TabIndent") static var tabIndent: go.GoUInt;

    @:native("NewWriter") static function newWriter(output: go.io.Writer, minwidth: go.GoInt, tabwidth: go.GoInt, padding: go.GoInt, padchar: go.Byte, flags: go.GoUInt): (go.Pointer<go.text.tabwriter.Writer>);

}