package go.text.template;

/**
    Template is the representation of a parsed template. The *parse.Tree
    field is exported only for use by [html/template] and should be treated
    as unexported by all other clients.
**/
@:structInit
@:go.Type({ name: "Template", instanceName: "template.Template", imports: ["text/template"] })
extern class Template {

    @:native("Tree") var tree: go.Pointer<go.text.template.parse.Tree>;
    @:native("ParseName") var parseName: String;
    @:native("Root") var root: go.Pointer<go.text.template.parse.ListNode>;
    @:native("Mode") var mode: go.text.template.parse.Mode;

    function new(tree: go.Pointer<go.text.template.parse.Tree>=null);

    /**
        AddParseTree associates the argument parse tree with the template t, giving
        it the specified name. If the template has not been defined, this tree becomes
        its definition. If it has been defined and already has that name, the existing
        definition is replaced; otherwise a new template is created, defined, and returned.
    **/
    @:native("AddParseTree") function addParseTree(name: String, tree: go.Pointer<go.text.template.parse.Tree>): (go.Result<go.Pointer<go.text.template.Template>>);
    /**
        Clone returns a duplicate of the template, including all associated
        templates. The actual representation is not copied, but the name space of
        associated templates is, so further calls to [Template.Parse] in the copy will add
        templates to the copy but not to the original. Clone can be used to prepare
        common templates and use them with variant definitions for other templates
        by adding the variants after the clone is made.
    **/
    @:native("Clone") function clone(): (go.Result<go.Pointer<go.text.template.Template>>);
    @:native("Copy") function copy(): (go.Pointer<go.text.template.parse.Tree>);
    /**
        DefinedTemplates returns a string listing the defined templates,
        prefixed by the string "; defined templates are: ". If there are none,
        it returns the empty string. For generating an error message here
        and in [html/template].
    **/
    @:native("DefinedTemplates") function definedTemplates(): (String);
    /**
        Delims sets the action delimiters to the specified strings, to be used in
        subsequent calls to [Template.Parse], [Template.ParseFiles], or [Template.ParseGlob]. Nested template
        definitions will inherit the settings. An empty delimiter stands for the
        corresponding default: {{ or }}.
        The return value is the template, so calls can be chained.
    **/
    @:native("Delims") function delims(left: String, right: String): (go.Pointer<go.text.template.Template>);
    @:go.Tuple("location", "context") @:native("ErrorContext") function errorContext(n: go.text.template.parse.Node): (go.Tuple<{ location: String, context: String }>);
    /**
        Execute applies a parsed template to the specified data object,
        and writes the output to wr.
        If an error occurs executing the template or writing its output,
        execution stops, but partial results may already have been written to
        the output writer.
        A template may be executed safely in parallel, although if parallel
        executions share a Writer the output may be interleaved.
        
        If data is a [reflect.Value], the template applies to the concrete
        value that the reflect.Value holds, as in [fmt.Print].
    **/
    @:native("Execute") function execute(wr: go.io.Writer, data: Dynamic): (go.Error);
    /**
        ExecuteTemplate applies the template associated with t that has the given name
        to the specified data object and writes the output to wr.
        If an error occurs executing the template or writing its output,
        execution stops, but partial results may already have been written to
        the output writer.
        A template may be executed safely in parallel, although if parallel
        executions share a Writer the output may be interleaved.
    **/
    @:native("ExecuteTemplate") function executeTemplate(wr: go.io.Writer, name: String, data: Dynamic): (go.Error);
    /**
        Funcs adds the elements of the argument map to the template's function map.
        It must be called before the template is parsed.
        It panics if a value in the map is not a function with appropriate return
        type or if the name cannot be used syntactically as a function in a template.
        It is legal to overwrite elements of the map. The return value is the template,
        so calls can be chained.
    **/
    @:native("Funcs") function funcs(funcMap: go.text.template.FuncMap): (go.Pointer<go.text.template.Template>);
    /**
        Lookup returns the template with the given name that is associated with t.
        It returns nil if there is no such template or the template has no definition.
    **/
    @:native("Lookup") function lookup(name: String): (go.Pointer<go.text.template.Template>);
    /**
        Name returns the name of the template.
    **/
    @:native("Name") function name(): (String);
    /**
        New allocates a new, undefined template associated with the given one and with the same
        delimiters. The association, which is transitive, allows one template to
        invoke another with a {{template}} action.
        
        Because associated templates share underlying data, template construction
        cannot be done safely in parallel. Once the templates are constructed, they
        can be executed in parallel.
    **/
    @:native("New") function _new(name: String): (go.Pointer<go.text.template.Template>);
    /**
        Option sets options for the template. Options are described by
        strings, either a simple string or "key=value". There can be at
        most one equals sign in an option string. If the option string
        is unrecognized or otherwise invalid, Option panics.
        
        Known options:
        
        missingkey: Control the behavior during execution if a map is
        indexed with a key that is not present in the map.
        
        	"missingkey=default" or "missingkey=invalid"
        		The default behavior: Do nothing and continue execution.
        		If printed, the result of the index operation is the string
        		"<no value>".
        	"missingkey=zero"
        		The operation returns the zero value for the map type's element.
        	"missingkey=error"
        		Execution stops immediately with an error.
    **/
    @:native("Option") function option(opt: haxe.Rest<String>): (go.Pointer<go.text.template.Template>);
    /**
        Parse parses text as a template body for t.
        Named template definitions ({{define ...}} or {{block ...}} statements) in text
        define additional templates associated with t and are removed from the
        definition of t itself.
        
        Templates can be redefined in successive calls to Parse.
        A template definition with a body containing only white space and comments
        is considered empty and will not replace an existing template's body.
        This allows using Parse to add new named template definitions without
        overwriting the main template body.
    **/
    @:native("Parse") function parse(text: String): (go.Result<go.Pointer<go.text.template.Template>>);
    /**
        ParseFS is like [Template.ParseFiles] or [Template.ParseGlob] but reads from the file system fsys
        instead of the host operating system's file system.
        It accepts a list of glob patterns (see [path.Match]).
        (Note that most file names serve as glob patterns matching only themselves.)
    **/
    @:native("ParseFS") function parseFS(fsys: go.io.fs.FS, patterns: haxe.Rest<String>): (go.Result<go.Pointer<go.text.template.Template>>);
    /**
        ParseFiles parses the named files and associates the resulting templates with
        t. If an error occurs, parsing stops and the returned template is nil;
        otherwise it is t. There must be at least one file.
        Since the templates created by ParseFiles are named by the base
        (see [filepath.Base]) names of the argument files, t should usually have the
        name of one of the (base) names of the files. If it does not, depending on
        t's contents before calling ParseFiles, t.Execute may fail. In that
        case use t.ExecuteTemplate to execute a valid template.
        
        When parsing multiple files with the same name in different directories,
        the last one mentioned will be the one that results.
    **/
    @:native("ParseFiles") function parseFiles(filenames: haxe.Rest<String>): (go.Result<go.Pointer<go.text.template.Template>>);
    /**
        ParseGlob parses the template definitions in the files identified by the
        pattern and associates the resulting templates with t. The files are matched
        according to the semantics of [filepath.Match], and the pattern must match at
        least one file. ParseGlob is equivalent to calling [Template.ParseFiles] with
        the list of files matched by the pattern.
        
        When parsing multiple files with the same name in different directories,
        the last one mentioned will be the one that results.
    **/
    @:native("ParseGlob") function parseGlob(pattern: String): (go.Result<go.Pointer<go.text.template.Template>>);
    /**
        Templates returns a slice of defined templates associated with t.
    **/
    @:native("Templates") function templates(): (go.Slice<go.Pointer<go.text.template.Template>>);

}