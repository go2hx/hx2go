package go.archive;

@:go.Type({ name: "tar", instanceName: "tar.tar", imports: ["archive/tar"] })
extern class Tar {

    @:native("FormatGNU") static var FormatGNU: go.archive.tar.Format;
    @:native("FormatPAX") static var FormatPAX: go.archive.tar.Format;
    @:native("FormatUSTAR") static var FormatUSTAR: go.archive.tar.Format;
    @:native("FormatUnknown") static var FormatUnknown: go.archive.tar.Format;
    @:native("TypeBlock") static var TypeBlock: go.Rune;
    @:native("TypeChar") static var TypeChar: go.Rune;
    @:native("TypeCont") static var TypeCont: go.Rune;
    @:native("TypeDir") static var TypeDir: go.Rune;
    @:native("TypeFifo") static var TypeFifo: go.Rune;
    @:native("TypeGNULongLink") static var TypeGNULongLink: go.Rune;
    @:native("TypeGNULongName") static var TypeGNULongName: go.Rune;
    @:native("TypeGNUSparse") static var TypeGNUSparse: go.Rune;
    @:native("TypeLink") static var TypeLink: go.Rune;
    @:native("TypeReg") static var TypeReg: go.Rune;
    @:native("TypeRegA") static var TypeRegA: go.Rune;
    @:native("TypeSymlink") static var TypeSymlink: go.Rune;
    @:native("TypeXGlobalHeader") static var TypeXGlobalHeader: go.Rune;
    @:native("TypeXHeader") static var TypeXHeader: go.Rune;

    @:native("FileInfoHeader") static function fileInfoHeader(fi: go.io.fs.FileInfo, link: String): go.Result<go.Pointer<go.archive.tar.Header>>;
    @:native("NewReader") static function newReader(r: go.io.Reader): go.Pointer<go.archive.tar.Reader>;
    @:native("NewWriter") static function newWriter(w: go.io.Writer): go.Pointer<go.archive.tar.Writer>;

}