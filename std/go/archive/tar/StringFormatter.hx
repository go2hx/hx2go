package go.archive.tar;

@:go.Type({ name: "stringFormatter", instanceName: "tar.stringFormatter", imports: ["archive/tar"] })
extern typedef StringFormatter = (p0: go.Slice<go.Byte>, p1: String) -> Void