package go.archive.tar;

@:go.Type({ name: "numberFormatter", instanceName: "tar.numberFormatter", imports: ["archive/tar"] })
extern typedef NumberFormatter = (p0: go.Slice<go.Byte>, p1: go.Int64) -> Void