package go.html.template;

/**
    JSStr encapsulates a sequence of characters meant to be embedded
    between quotes in a JavaScript expression.
    The string must match a series of StringCharacters:
      StringCharacter :: SourceCharacter but not `\` or LineTerminator
                       | EscapeSequence
    Note that LineContinuations are not allowed.
    JSStr("foo\\nbar") is fine, but JSStr("foo\\\nbar") is not.
    
    Use of this type presents a security risk:
    the encapsulated content should come from a trusted source,
    as it will be included verbatim in the template output.
**/
@:go.Type({ name: "JSStr", instanceName: "template.JSStr", imports: ["html/template"] })
extern typedef JSStr = String