package go.html.template;

/**
    CSS encapsulates known safe content that matches any of:
      1. The CSS3 stylesheet production, such as `p { color: purple }`.
      2. The CSS3 rule production, such as `a[href=~"https:"].foo#bar`.
      3. CSS3 declaration productions, such as `color: red; margin: 2px`.
      4. The CSS3 value production, such as `rgba(0, 0, 255, 127)`.
    See https://www.w3.org/TR/css3-syntax/#parsing and
    https://web.archive.org/web/20090211114933/http://w3.org/TR/css3-syntax#style
    
    Use of this type presents a security risk:
    the encapsulated content should come from a trusted source,
    as it will be included verbatim in the template output.
**/
@:go.Type({ name: "CSS", instanceName: "template.CSS", imports: ["html/template"] })
extern typedef CSS = String