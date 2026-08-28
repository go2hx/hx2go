package go.html.template;

/**
    HTMLAttr encapsulates an HTML attribute from a trusted source,
    for example, ` dir="ltr"`.
    
    Use of this type presents a security risk:
    the encapsulated content should come from a trusted source,
    as it will be included verbatim in the template output.
**/
@:go.Type({ name: "HTMLAttr", instanceName: "template.HTMLAttr", imports: ["html/template"] })
extern typedef HTMLAttr = String