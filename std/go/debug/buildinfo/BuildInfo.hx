package go.debug.buildinfo;

/**
    Type alias for build info. We cannot move the types here, since
    runtime/debug would need to import this package, which would make it
    a much larger dependency.
**/
@:go.Type({ name: "BuildInfo", instanceName: "buildinfo.BuildInfo", imports: ["debug/buildinfo"] })
extern typedef BuildInfo = go.runtime.debug.BuildInfo