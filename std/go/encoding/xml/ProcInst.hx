package go.encoding.xml;

@:structInit
@:go.Type({ name: "ProcInst", instanceName: "xml.ProcInst", imports: ["encoding/xml"] })
extern class ProcInst {

    @:native("Target") var target: String;
    @:native("Inst") var inst: go.Slice<go.Byte>;

function new(target: String, inst: go.Slice<go.Byte>);

    @:native("Copy") function copy(): go.encoding.xml.ProcInst;

}