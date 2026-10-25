package go.encoding.json;

/**
    Options are a set of options to configure the v2 "json" package
    to operate with v1 semantics for particular features.
    Values of this type can be passed to v2 functions like
    [jsonv2.Marshal] or [jsonv2.Unmarshal].
    Instead of referencing this type, use [jsonv2.Options].
    
    See the "Migrating to v2" section for guidance on how to migrate usage
    of "json" from using v1 to using v2 instead.
**/
@:go.Type({ name: "Options", instanceName: "json.Options", imports: ["encoding/json"] })
extern typedef Options = Dynamic