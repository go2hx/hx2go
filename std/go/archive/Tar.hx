package go.archive;

@:go.Type({ name: "tar", instanceName: "tar.tar", imports: ["archive/tar"] })
extern class Tar {

    @:native("FormatGNU") static var formatGNU: go.archive.tar.Format;
    @:native("FormatPAX") static var formatPAX: go.archive.tar.Format;
    @:native("FormatUSTAR") static var formatUSTAR: go.archive.tar.Format;
    @:native("FormatUnknown") static var formatUnknown: go.archive.tar.Format;
    @:native("TypeBlock") static var typeBlock: go.Rune;
    @:native("TypeChar") static var typeChar: go.Rune;
    @:native("TypeCont") static var typeCont: go.Rune;
    @:native("TypeDir") static var typeDir: go.Rune;
    @:native("TypeFifo") static var typeFifo: go.Rune;
    @:native("TypeGNULongLink") static var typeGNULongLink: go.Rune;
    @:native("TypeGNULongName") static var typeGNULongName: go.Rune;
    @:native("TypeGNUSparse") static var typeGNUSparse: go.Rune;
    @:native("TypeLink") static var typeLink: go.Rune;
    @:native("TypeReg") static var typeReg: go.Rune;
    @:native("TypeRegA") static var typeRegA: go.Rune;
    @:native("TypeSymlink") static var typeSymlink: go.Rune;
    @:native("TypeXGlobalHeader") static var typeXGlobalHeader: go.Rune;
    @:native("TypeXHeader") static var typeXHeader: go.Rune;

    @:native("FileInfoHeader") static function fileInfoHeader(fi: go.io.fs.FileInfo, link: String): (go.Result<go.Pointer<go.archive.tar.Header>>);
    @:native("NewReader") static function newReader(r: go.io.Reader): (go.Pointer<go.archive.tar.Reader>);
    @:native("NewWriter") static function newWriter(w: go.io.Writer): (go.Pointer<go.archive.tar.Writer>);

}