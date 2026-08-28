package go.encoding;

/**
    Package csv reads and writes comma-separated values (CSV) files.
    There are many kinds of CSV files; this package supports the format
    described in RFC 4180, except that [Writer] uses LF
    instead of CRLF as newline character by default.
    
    A csv file contains zero or more records of one or more fields per record.
    Each record is separated by the newline character. The final record may
    optionally be followed by a newline character.
    
    	field1,field2,field3
    
    White space is considered part of a field.
    
    Carriage returns before newline characters are silently removed.
    
    Blank lines are ignored. A line with only whitespace characters (excluding
    the ending newline character) is not considered a blank line.
    
    Fields which start and stop with the quote character " are called
    quoted-fields. The beginning and ending quote are not part of the
    field.
    
    The source:
    
    	normal string,"quoted-field"
    
    results in the fields
    
    	{`normal string`, `quoted-field`}
    
    Within a quoted-field a quote character followed by a second quote
    character is considered a single quote.
    
    	"the ""word"" is true","a ""quoted-field"""
    
    results in
    
    	{`the "word" is true`, `a "quoted-field"`}
    
    Newlines and commas may be included in a quoted-field
    
    	"Multi-line
    	field","comma is ,"
    
    results in
    
    	{`Multi-line
    	field`, `comma is ,`}
**/
@:go.Type({ name: "csv", instanceName: "csv.csv", imports: ["encoding/csv"] })
extern class Csv {

    /**
        NewReader returns a new Reader that reads from r.
    **/
    @:native("NewReader") static function newReader(r: go.io.Reader): (go.Pointer<go.encoding.csv.Reader>);
    /**
        NewWriter returns a new Writer that writes to w.
    **/
    @:native("NewWriter") static function newWriter(w: go.io.Writer): (go.Pointer<go.encoding.csv.Writer>);

}