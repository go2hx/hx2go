package go.testing.slogtest;

@:go.Type({ name: "check", instanceName: "slogtest.check", imports: ["testing/slogtest"] })
extern typedef Check = (p0: go.Map<String, Dynamic>) -> (String)