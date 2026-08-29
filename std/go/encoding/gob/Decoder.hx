package go.encoding.gob;

/**
    A Decoder manages the receipt of type and data information read from the
    remote side of a connection.  It is safe for concurrent use by multiple
    goroutines.
    
    The Decoder does only basic sanity checking on decoded input sizes,
    and its limits are not configurable. Take caution when decoding gob data
    from untrusted sources.
**/
@:structInit
@:go.Type({ name: "Decoder", instanceName: "gob.Decoder", imports: ["encoding/gob"] })
extern class Decoder {

    /**
        Decode reads the next value from the input stream and stores
        it in the data represented by the empty interface value.
        If e is nil, the value will be discarded. Otherwise,
        the value underlying e must be a pointer to the
        correct type for the next data item received.
        If the input is at EOF, Decode returns [io.EOF] and
        does not modify e.
    **/
    @:native("Decode") function decode(e: Dynamic): (go.Error);
    /**
        DecodeValue reads the next value from the input stream.
        If v is the zero reflect.Value (v.Kind() == Invalid), DecodeValue discards the value.
        Otherwise, it stores the value into v. In that case, v must represent
        a non-nil pointer to data or be an assignable reflect.Value (v.CanSet())
        If the input is at EOF, DecodeValue returns [io.EOF] and
        does not modify v.
    **/
    @:native("DecodeValue") function decodeValue(v: go.reflect.Value): (go.Error);

}