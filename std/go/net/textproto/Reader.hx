package go.net.textproto;

/**
    A Reader implements convenience methods for reading requests
    or responses from a text protocol network connection.
**/
@:structInit
@:go.Type({ name: "Reader", instanceName: "textproto.Reader", imports: ["net/textproto"] })
extern class Reader {

    @:native("R") var R: go.Pointer<go.bufio.Reader>;

    function new(R: go.Pointer<go.bufio.Reader>=null);

    /**
        DotReader returns a new [Reader] that satisfies Reads using the
        decoded text of a dot-encoded block read from r.
        The returned Reader is only valid until the next call
        to a method on r.
        
        Dot encoding is a common framing used for data blocks
        in text protocols such as SMTP.  The data consists of a sequence
        of lines, each of which ends in "\r\n".  The sequence itself
        ends at a line containing just a dot: ".\r\n".  Lines beginning
        with a dot are escaped with an additional dot to avoid
        looking like the end of the sequence.
        
        The decoded form returned by the Reader's Read method
        rewrites the "\r\n" line endings into the simpler "\n",
        removes leading dot escapes if present, and stops with error [io.EOF]
        after consuming (and discarding) the end-of-sequence line.
    **/
    @:native("DotReader") function dotReader(): (go.io.Reader);
    /**
        ReadCodeLine reads a response code line of the form
        
        	code message
        
        where code is a three-digit status code and the message
        extends to the rest of the line. An example of such a line is:
        
        	220 plan9.bell-labs.com ESMTP
        
        If the prefix of the status does not match the digits in expectCode,
        ReadCodeLine returns with err set to &Error{code, message}.
        For example, if expectCode is 31, an error will be returned if
        the status is not in the range [310,319].
        
        If the response is multi-line, ReadCodeLine returns an error.
        
        An expectCode <= 0 disables the check of the status code.
    **/
    @:go.Tuple("code", "message", "err") @:native("ReadCodeLine") function readCodeLine(expectCode: go.GoInt): (go.Tuple<{ code: go.GoInt, message: String, err: go.Error }>);
    /**
        ReadContinuedLine reads a possibly continued line from r,
        eliding the final trailing ASCII white space.
        Lines after the first are considered continuations if they
        begin with a space or tab character. In the returned data,
        continuation lines are separated from the previous line
        only by a single space: the newline and leading white space
        are removed.
        
        For example, consider this input:
        
        	Line 1
        	  continued...
        	Line 2
        
        The first call to ReadContinuedLine will return "Line 1 continued..."
        and the second will return "Line 2".
        
        Empty lines are never continued.
    **/
    @:native("ReadContinuedLine") function readContinuedLine(): (go.Result<String>);
    /**
        ReadContinuedLineBytes is like [Reader.ReadContinuedLine] but
        returns a []byte instead of a string.
    **/
    @:native("ReadContinuedLineBytes") function readContinuedLineBytes(): (go.Result<go.Slice<go.Byte>>);
    /**
        ReadDotBytes reads a dot-encoding and returns the decoded data.
        
        See the documentation for the [Reader.DotReader] method for details about dot-encoding.
    **/
    @:native("ReadDotBytes") function readDotBytes(): (go.Result<go.Slice<go.Byte>>);
    /**
        ReadDotLines reads a dot-encoding and returns a slice
        containing the decoded lines, with the final \r\n or \n elided from each.
        
        See the documentation for the [Reader.DotReader] method for details about dot-encoding.
    **/
    @:native("ReadDotLines") function readDotLines(): (go.Result<go.Slice<String>>);
    /**
        ReadLine reads a single line from r,
        eliding the final \n or \r\n from the returned string.
    **/
    @:native("ReadLine") function readLine(): (go.Result<String>);
    /**
        ReadLineBytes is like [Reader.ReadLine] but returns a []byte instead of a string.
    **/
    @:native("ReadLineBytes") function readLineBytes(): (go.Result<go.Slice<go.Byte>>);
    /**
        ReadMIMEHeader reads a MIME-style header from r.
        The header is a sequence of possibly continued Key: Value lines
        ending in a blank line.
        The returned map m maps [CanonicalMIMEHeaderKey](key) to a
        sequence of values in the same order encountered in the input.
        
        For example, consider this input:
        
        	My-Key: Value 1
        	Long-Key: Even
        	       Longer Value
        	My-Key: Value 2
        
        Given that input, ReadMIMEHeader returns the map:
        
        	map[string][]string{
        		"My-Key": {"Value 1", "Value 2"},
        		"Long-Key": {"Even Longer Value"},
        	}
    **/
    @:native("ReadMIMEHeader") function readMIMEHeader(): (go.Result<go.net.textproto.MIMEHeader>);
    /**
        ReadResponse reads a multi-line response of the form:
        
        	code-message line 1
        	code-message line 2
        	...
        	code message line n
        
        where code is a three-digit status code. The first line starts with the
        code and a hyphen. The response is terminated by a line that starts
        with the same code followed by a space. Each line in message is
        separated by a newline (\n).
        
        See page 36 of RFC 959 (https://www.ietf.org/rfc/rfc959.txt) for
        details of another form of response accepted:
        
        	code-message line 1
        	message line 2
        	...
        	code message line n
        
        If the prefix of the status does not match the digits in expectCode,
        ReadResponse returns with err set to &Error{code, message}.
        For example, if expectCode is 31, an error will be returned if
        the status is not in the range [310,319].
        
        An expectCode <= 0 disables the check of the status code.
    **/
    @:go.Tuple("code", "message", "err") @:native("ReadResponse") function readResponse(expectCode: go.GoInt): (go.Tuple<{ code: go.GoInt, message: String, err: go.Error }>);

}