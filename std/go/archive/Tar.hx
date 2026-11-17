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
    @:native("FormatGNU") static final formatGNU: go.archive.tar.Format;
    /**
        Constants to identify various tar formats.
    **/
    @:native("FormatPAX") static final formatPAX: go.archive.tar.Format;
    /**
        Constants to identify various tar formats.
    **/
    @:native("FormatUSTAR") static final formatUSTAR: go.archive.tar.Format;
    /**
        Constants to identify various tar formats.
    **/
    @:native("FormatUnknown") static final formatUnknown: go.archive.tar.Format;
    /**
        Type flags for Header.Typeflag.
    **/
    @:native("TypeBlock") static final typeBlock: go.Rune;
    /**
        Type flags for Header.Typeflag.
    **/
    @:native("TypeChar") static final typeChar: go.Rune;
    /**
        Type flags for Header.Typeflag.
    **/
    @:native("TypeCont") static final typeCont: go.Rune;
    /**
        Type flags for Header.Typeflag.
    **/
    @:native("TypeDir") static final typeDir: go.Rune;
    /**
        Type flags for Header.Typeflag.
    **/
    @:native("TypeFifo") static final typeFifo: go.Rune;
    /**
        Type flags for Header.Typeflag.
    **/
    @:native("TypeGNULongLink") static final typeGNULongLink: go.Rune;
    /**
        Type flags for Header.Typeflag.
    **/
    @:native("TypeGNULongName") static final typeGNULongName: go.Rune;
    /**
        Type flags for Header.Typeflag.
    **/
    @:native("TypeGNUSparse") static final typeGNUSparse: go.Rune;
    /**
        Type flags for Header.Typeflag.
    **/
    @:native("TypeLink") static final typeLink: go.Rune;
    /**
        Type flags for Header.Typeflag.
    **/
    @:native("TypeReg") static final typeReg: go.Rune;
    /**
        Type flags for Header.Typeflag.
    **/
    @:native("TypeRegA") static final typeRegA: go.Rune;
    /**
        Type flags for Header.Typeflag.
    **/
    @:native("TypeSymlink") static final typeSymlink: go.Rune;
    /**
        Type flags for Header.Typeflag.
    **/
    @:native("TypeXGlobalHeader") static final typeXGlobalHeader: go.Rune;
    /**
        Type flags for Header.Typeflag.
    **/
    @:native("TypeXHeader") static final typeXHeader: go.Rune;

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