package go.archive.tar;

/**
    Format represents the tar archive format.
    
    The original tar format was introduced in Unix V7.
    Since then, there have been multiple competing formats attempting to
    standardize or extend the V7 format to overcome its limitations.
    The most common formats are the USTAR, PAX, and GNU formats,
    each with their own advantages and limitations.
    
    The following table captures the capabilities of each format:
    
    	                  |  USTAR |       PAX |       GNU
    	------------------+--------+-----------+----------
    	Name              |   256B | unlimited | unlimited
    	Linkname          |   100B | unlimited | unlimited
    	Size              | uint33 | unlimited |    uint89
    	Mode              | uint21 |    uint21 |    uint57
    	Uid/Gid           | uint21 | unlimited |    uint57
    	Uname/Gname       |    32B | unlimited |       32B
    	ModTime           | uint33 | unlimited |     int89
    	AccessTime        |    n/a | unlimited |     int89
    	ChangeTime        |    n/a | unlimited |     int89
    	Devmajor/Devminor | uint21 |    uint21 |    uint57
    	------------------+--------+-----------+----------
    	string encoding   |  ASCII |     UTF-8 |    binary
    	sub-second times  |     no |       yes |        no
    	sparse files      |     no |       yes |       yes
    
    The table's upper portion shows the [Header] fields, where each format reports
    the maximum number of bytes allowed for each string field and
    the integer type used to store each numeric field
    (where timestamps are stored as the number of seconds since the Unix epoch).
    
    The table's lower portion shows specialized features of each format,
    such as supported string encodings, support for sub-second timestamps,
    or support for sparse files.
    
    The Writer currently provides no support for sparse files.
**/
@:go.Type({ name: "Format", instanceName: "tar.Format", imports: ["archive/tar"] })
extern typedef Format = haxe.extern.EitherType<go.GoInt, {
    @:native("String") function string(): (String);

}>