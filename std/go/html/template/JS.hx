package go.html.template;

/**
    JS encapsulates a known safe EcmaScript5 Expression, for example,
    `(x + y * z())`.
    Template authors are responsible for ensuring that typed expressions
    do not break the intended precedence and that there is no
    statement/expression ambiguity as when passing an expression like
    "{ foo: bar() }\n['foo']()", which is both a valid Expression and a
    valid Program with a very different meaning.
    
    Use of this type presents a security risk:
    the encapsulated content should come from a trusted source,
    as it will be included verbatim in the template output.
    
    Using JS to include valid but untrusted JSON is not safe.
    A safe alternative is to parse the JSON with json.Unmarshal and then
    pass the resultant object into the template, where it will be
    converted to sanitized JSON when presented in a JavaScript context.
**/
@:go.Type({ name: "JS", instanceName: "template.JS", imports: ["html/template"] })
extern typedef JS = String