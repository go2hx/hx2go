package go.go.doc.comment;

/**
    A DocLink is a link to documentation for a Go package or symbol.
**/
@:structInit
@:go.Type({ name: "DocLink", instanceName: "comment.DocLink", imports: ["go/doc/comment"] })
extern class DocLink {

    @:native("Text") var text: go.Slice<go.go.doc.comment.Text>;
    @:native("ImportPath") var importPath: String;
    @:native("Recv") var recv: String;
    @:native("Name") var name: String;

    function new(text: go.Slice<go.go.doc.comment.Text>=null, importPath: String="", recv: String="", name: String="");

    /**
        DefaultURL constructs and returns the documentation URL for l,
        using baseURL as a prefix for links to other packages.
        
        The possible forms returned by DefaultURL are:
          - baseURL/ImportPath, for a link to another package
          - baseURL/ImportPath#Name, for a link to a const, func, type, or var in another package
          - baseURL/ImportPath#Recv.Name, for a link to a method in another package
          - #Name, for a link to a const, func, type, or var in this package
          - #Recv.Name, for a link to a method in this package
        
        If baseURL ends in a trailing slash, then DefaultURL inserts
        a slash between ImportPath and # in the anchored forms.
        For example, here are some baseURL values and URLs they can generate:
        
        	"/pkg/" → "/pkg/math/#Sqrt"
        	"/pkg"  → "/pkg/math#Sqrt"
        	"/"     → "/math/#Sqrt"
        	""      → "/math#Sqrt"
    **/
    @:native("DefaultURL") function defaultURL(baseURL: String): (String);

}