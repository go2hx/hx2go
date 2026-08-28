package go.html.template;

/**
    Template is a specialized Template from "text/template" that produces a safe
    HTML document fragment.
**/
@:structInit
@:go.Type({ name: "Template", instanceName: "template.Template", imports: ["html/template"] })
extern class Template {

    @:native("Tree") var tree: go.Pointer<go.text.template.parse.Tree>;

    function new(tree: go.Pointer<go.text.template.parse.Tree>=null);

    /**
        AddParseTree creates a new template with the name and parse tree
        and associates it with t.
        
        It returns an error if t or any associated template has already been executed.
    **/
    @:native("AddParseTree") function addParseTree(name: String, tree: go.Pointer<go.text.template.parse.Tree>): (go.Result<go.Pointer<go.html.template.Template>>);
    /**
        Clone returns a duplicate of the template, including all associated
        templates. The actual representation is not copied, but the name space of
        associated templates is, so further calls to [Template.Parse] in the copy will add
        templates to the copy but not to the original. [Template.Clone] can be used to prepare
        common templates and use them with variant definitions for other templates
        by adding the variants after the clone is made.
        
        It returns an error if t has already been executed.
    **/
    @:native("Clone") function clone(): (go.Result<go.Pointer<go.html.template.Template>>);
    /**
        DefinedTemplates returns a string listing the defined templates,
        prefixed by the string "; defined templates are: ". If there are none,
        it returns the empty string. Used to generate an error message.
    **/
    @:native("DefinedTemplates") function definedTemplates(): (String);
    /**
        Delims sets the action delimiters to the specified strings, to be used in
        subsequent calls to [Template.Parse], [ParseFiles], or [ParseGlob]. Nested template
        definitions will inherit the settings. An empty delimiter stands for the
        corresponding default: {{ or }}.
        The return value is the template, so calls can be chained.
    **/
    @:native("Delims") function delims(left: String, right: String): (go.Pointer<go.html.template.Template>);
    /**
        Execute applies a parsed template to the specified data object,
        writing the output to wr.
        If an error occurs executing the template or writing its output,
        execution stops, but partial results may already have been written to
        the output writer.
        A template may be executed safely in parallel, although if parallel
        executions share a Writer the output may be interleaved.
    **/
    @:native("Execute") function execute(wr: go.io.Writer, data: Dynamic): (go.Error);
    /**
        ExecuteTemplate applies the template associated with t that has the given
        name to the specified data object and writes the output to wr.
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
        type. However, it is legal to overwrite elements of the map. The return
        value is the template, so calls can be chained.
    **/
    @:native("Funcs") function funcs(funcMap: go.html.template.FuncMap): (go.Pointer<go.html.template.Template>);
    /**
        Lookup returns the template with the given name that is associated with t,
        or nil if there is no such template.
    **/
    @:native("Lookup") function lookup(name: String): (go.Pointer<go.html.template.Template>);
    /**
        Name returns the name of the template.
    **/
    @:native("Name") function name(): (String);
    /**
        New allocates a new HTML template associated with the given one
        and with the same delimiters. The association, which is transitive,
        allows one template to invoke another with a {{template}} action.
        
        If a template with the given name already exists, the new HTML template
        will replace it. The existing template will be reset and disassociated with
        t.
    **/
    @:native("New") function _new(name: String): (go.Pointer<go.html.template.Template>);
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
    @:native("Option") function option(opt: haxe.Rest<String>): (go.Pointer<go.html.template.Template>);
    /**
        Parse parses text as a template body for t.
        Named template definitions ({{define ...}} or {{block ...}} statements) in text
        define additional templates associated with t and are removed from the
        definition of t itself.
        
        Templates can be redefined in successive calls to Parse,
        before the first use of [Template.Execute] on t or any associated template.
        A template definition with a body containing only white space and comments
        is considered empty and will not replace an existing template's body.
        This allows using Parse to add new named template definitions without
        overwriting the main template body.
    **/
    @:native("Parse") function parse(text: String): (go.Result<go.Pointer<go.html.template.Template>>);
    /**
        ParseFS is like [Template.ParseFiles] or [Template.ParseGlob] but reads from the file system fs
        instead of the host operating system's file system.
        It accepts a list of glob patterns.
        (Note that most file names serve as glob patterns matching only themselves.)
    **/
    @:native("ParseFS") function parseFS(fs: go.io.fs.FS, patterns: haxe.Rest<String>): (go.Result<go.Pointer<go.html.template.Template>>);
    /**
        ParseFiles parses the named files and associates the resulting templates with
        t. If an error occurs, parsing stops and the returned template is nil;
        otherwise it is t. There must be at least one file.
        
        When parsing multiple files with the same name in different directories,
        the last one mentioned will be the one that results.
        
        ParseFiles returns an error if t or any associated template has already been executed.
    **/
    @:native("ParseFiles") function parseFiles(filenames: haxe.Rest<String>): (go.Result<go.Pointer<go.html.template.Template>>);
    /**
        ParseGlob parses the template definitions in the files identified by the
        pattern and associates the resulting templates with t. The files are matched
        according to the semantics of filepath.Match, and the pattern must match at
        least one file. ParseGlob is equivalent to calling t.ParseFiles with the
        list of files matched by the pattern.
        
        When parsing multiple files with the same name in different directories,
        the last one mentioned will be the one that results.
        
        ParseGlob returns an error if t or any associated template has already been executed.
    **/
    @:native("ParseGlob") function parseGlob(pattern: String): (go.Result<go.Pointer<go.html.template.Template>>);
    /**
        Templates returns a slice of the templates associated with t, including t
        itself.
    **/
    @:native("Templates") function templates(): (go.Slice<go.Pointer<go.html.template.Template>>);

}