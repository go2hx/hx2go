package go.go.parser;

/**
    A Mode value is a set of flags (or 0).
    They control the amount of source code parsed and other optional
    parser functionality.
**/
@:go.Type({ name: "Mode", instanceName: "parser.Mode", imports: ["go/parser"] })
extern typedef Mode = go.GoUInt