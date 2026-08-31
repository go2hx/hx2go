package go.encoding.xml;

/**
    A ProcInst represents an XML processing instruction of the form <?target inst?>
**/
@:structInit
@:go.Type({ name: "ProcInst", instanceName: "xml.ProcInst", imports: ["encoding/xml"] })
extern class ProcInst {

    @:native("Target") var target: String;
    @:native("Inst") var inst: go.Slice<go.Byte>;

    function new(target: String="", inst: go.Slice<go.Byte>=null);

    /**
        Copy creates a new copy of ProcInst.
    **/
    @:native("Copy") function copy(): (go.encoding.xml.ProcInst);

}