package go.archive;

/**
    Package tar implements access to tar archives.
    
    Tape archives (tar) are a file format for storing a sequence of files that
    can be read and written in a streaming manner.
    This package aims to cover most variations of the format,
    including those produced by GNU and BSD tar tools.
**/
@:go.Type({ name: "tar", instanceName: "tar.tar", imports: ["archive/tar"] })
extern class Tar {

    /**
        Constants to identify various tar formats.
    **/
    @:native("FormatGNU") static var formatGNU: go.archive.tar.Format;
    /**
        Constants to identify various tar formats.
    **/
    @:native("FormatPAX") static var formatPAX: go.archive.tar.Format;
    /**
        Constants to identify various tar formats.
    **/
    @:native("FormatUSTAR") static var formatUSTAR: go.archive.tar.Format;
    /**
        Constants to identify various tar formats.
    **/
    @:native("FormatUnknown") static var formatUnknown: go.archive.tar.Format;
    /**
        Type flags for Header.Typeflag.
    **/
    @:native("TypeBlock") static var typeBlock: go.Rune;
    /**
        Type flags for Header.Typeflag.
    **/
    @:native("TypeChar") static var typeChar: go.Rune;
    /**
        Type flags for Header.Typeflag.
    **/
    @:native("TypeCont") static var typeCont: go.Rune;
    /**
        Type flags for Header.Typeflag.
    **/
    @:native("TypeDir") static var typeDir: go.Rune;
    /**
        Type flags for Header.Typeflag.
    **/
    @:native("TypeFifo") static var typeFifo: go.Rune;
    /**
        Type flags for Header.Typeflag.
    **/
    @:native("TypeGNULongLink") static var typeGNULongLink: go.Rune;
    /**
        Type flags for Header.Typeflag.
    **/
    @:native("TypeGNULongName") static var typeGNULongName: go.Rune;
    /**
        Type flags for Header.Typeflag.
    **/
    @:native("TypeGNUSparse") static var typeGNUSparse: go.Rune;
    /**
        Type flags for Header.Typeflag.
    **/
    @:native("TypeLink") static var typeLink: go.Rune;
    /**
        Type flags for Header.Typeflag.
    **/
    @:native("TypeReg") static var typeReg: go.Rune;
    /**
        Type flags for Header.Typeflag.
    **/
    @:native("TypeRegA") static var typeRegA: go.Rune;
    /**
        Type flags for Header.Typeflag.
    **/
    @:native("TypeSymlink") static var typeSymlink: go.Rune;
    /**
        Type flags for Header.Typeflag.
    **/
    @:native("TypeXGlobalHeader") static var typeXGlobalHeader: go.Rune;
    /**
        Type flags for Header.Typeflag.
    **/
    @:native("TypeXHeader") static var typeXHeader: go.Rune;

    /**
        FileInfoHeader creates a partially-populated [Header] from fi.
        If fi describes a symlink, FileInfoHeader records link as the link target.
        If fi describes a directory, a slash is appended to the name.
        
        Since fs.FileInfo's Name method only returns the base name of
        the file it describes, it may be necessary to modify Header.Name
        to provide the full path name of the file.
        
        If fi implements [FileInfoNames]
        Header.Gname and Header.Uname
        are provided by the methods of the interface.
    **/
    @:native("FileInfoHeader") static function fileInfoHeader(fi: go.io.fs.FileInfo, link: String): (go.Result<go.Pointer<go.archive.tar.Header>>);
    /**
        NewReader creates a new [Reader] reading from r.
    **/
    @:native("NewReader") static function newReader(r: go.io.Reader): (go.Pointer<go.archive.tar.Reader>);
    /**
        NewWriter creates a new Writer writing to w.
    **/
    @:native("NewWriter") static function newWriter(w: go.io.Writer): (go.Pointer<go.archive.tar.Writer>);

}