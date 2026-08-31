package go.html.template;

/**
    Srcset encapsulates a known safe srcset attribute
    (see https://w3c.github.io/html/semantics-embedded-content.html#element-attrdef-img-srcset).
    
    Use of this type presents a security risk:
    the encapsulated content should come from a trusted source,
    as it will be included verbatim in the template output.
**/
@:go.Type({ name: "Srcset", instanceName: "template.Srcset", imports: ["html/template"] })
extern typedef Srcset = String