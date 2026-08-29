package go.text;

/**
    Package tabwriter implements a write filter (tabwriter.Writer) that
    translates tabbed columns in input into properly aligned text.
    
    The package is using the Elastic Tabstops algorithm described at
    http://nickgravgaard.com/elastictabstops/index.html.
    
    The text/tabwriter package is frozen and is not accepting new features.
**/
@:go.Type({ name: "tabwriter", instanceName: "tabwriter.tabwriter", imports: ["text/tabwriter"] })
extern class Tabwriter {

    /**
        Formatting can be controlled with these flags.
    **/
    @:native("AlignRight") static var alignRight: go.GoUInt;
    /**
        Formatting can be controlled with these flags.
    **/
    @:native("Debug") static var debug: go.GoUInt;
    /**
        Formatting can be controlled with these flags.
    **/
    @:native("DiscardEmptyColumns") static var discardEmptyColumns: go.GoUInt;
    /**
        To escape a text segment, bracket it with Escape characters.
        For instance, the tab in this string "Ignore this tab: \xff\t\xff"
        does not terminate a cell and constitutes a single character of
        width one for formatting purposes.
        
        The value 0xff was chosen because it cannot appear in a valid UTF-8 sequence.
    **/
    @:native("Escape") static var escape: go.Rune;
    /**
        Formatting can be controlled with these flags.
    **/
    @:native("FilterHTML") static var filterHTML: go.GoUInt;
    /**
        Formatting can be controlled with these flags.
    **/
    @:native("StripEscape") static var stripEscape: go.GoUInt;
    /**
        Formatting can be controlled with these flags.
    **/
    @:native("TabIndent") static var tabIndent: go.GoUInt;

    /**
        NewWriter allocates and initializes a new [Writer].
        The parameters are the same as for the Init function.
    **/
    @:native("NewWriter") static function newWriter(output: go.io.Writer, minwidth: go.GoInt, tabwidth: go.GoInt, padding: go.GoInt, padchar: go.Byte, flags: go.GoUInt): (go.Pointer<go.text.tabwriter.Writer>);

}