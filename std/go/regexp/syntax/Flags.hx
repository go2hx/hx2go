package go.regexp.syntax;

/**
    Flags control the behavior of the parser and record information about regexp context.
**/
@:go.Type({ name: "Flags", instanceName: "syntax.Flags", imports: ["regexp/syntax"] })
extern typedef Flags = go.UInt16