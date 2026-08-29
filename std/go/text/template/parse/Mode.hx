package go.text.template.parse;

/**
    A Mode value is a set of flags (or 0). Modes control parser behavior.
**/
@:go.Type({ name: "Mode", instanceName: "parse.Mode", imports: ["text/template/parse"] })
extern typedef Mode = go.GoUInt