package go.strings;

/**
    A Builder is used to efficiently build a string using [Builder.Write] methods.
    It minimizes memory copying. The zero value is ready to use.
    Do not copy a non-zero Builder.
**/
@:structInit
@:go.Type({ name: "Builder", instanceName: "strings.Builder", imports: ["strings"] })
extern class Builder {

    /**
        Cap returns the capacity of the builder's underlying byte slice. It is the
        total space allocated for the string being built and includes any bytes
        already written.
    **/
    @:native("Cap") function cap(): (go.GoInt);
    /**
        Grow grows b's capacity, if necessary, to guarantee space for
        another n bytes. After Grow(n), at least n bytes can be written to b
        without another allocation. If n is negative, Grow panics.
    **/
    @:native("Grow") function grow(n: go.GoInt): Void;
    /**
        Len returns the number of accumulated bytes; b.Len() == len(b.String()).
    **/
    @:native("Len") function len(): (go.GoInt);
    /**
        Reset resets the [Builder] to be empty.
    **/
    @:native("Reset") function reset(): Void;
    /**
        String returns the accumulated string.
    **/
    @:native("String") function string(): (String);
    /**
        Write appends the contents of p to b's buffer.
        Write always returns len(p), nil.
    **/
    @:native("Write") function write(p: go.Slice<go.Byte>): (go.Result<go.GoInt>);
    /**
        WriteByte appends the byte c to b's buffer.
        The returned error is always nil.
    **/
    @:native("WriteByte") function writeByte(c: go.Byte): (go.Error);
    /**
        WriteRune appends the UTF-8 encoding of Unicode code point r to b's buffer.
        It returns the length of r and a nil error.
    **/
    @:native("WriteRune") function writeRune(r: go.Rune): (go.Result<go.GoInt>);
    /**
        WriteString appends the contents of s to b's buffer.
        It returns the length of s and a nil error.
    **/
    @:native("WriteString") function writeString(s: String): (go.Result<go.GoInt>);

}