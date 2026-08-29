package go.html.template;

/**
    HTML encapsulates a known safe HTML document fragment.
    It should not be used for HTML from a third-party, or HTML with
    unclosed tags or comments. The outputs of a sound HTML sanitizer
    and a template escaped by this package are fine for use with HTML.
    
    Use of this type presents a security risk:
    the encapsulated content should come from a trusted source,
    as it will be included verbatim in the template output.
**/
@:go.Type({ name: "HTML", instanceName: "template.HTML", imports: ["html/template"] })
extern typedef HTML = String