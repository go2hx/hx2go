package go.html.template;

/**
    URL encapsulates a known safe URL or URL substring (see RFC 3986).
    A URL like `javascript:checkThatFormNotEditedBeforeLeavingPage()`
    from a trusted source should go in the page, but by default dynamic
    `javascript:` URLs are filtered out since they are a frequently
    exploited injection vector.
    
    Use of this type presents a security risk:
    the encapsulated content should come from a trusted source,
    as it will be included verbatim in the template output.
**/
@:go.Type({ name: "URL", instanceName: "template.URL", imports: ["html/template"] })
extern typedef URL = String