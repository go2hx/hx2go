package go.encoding.gob;

/**
    An Encoder manages the transmission of type and data information to the
    other side of a connection.  It is safe for concurrent use by multiple
    goroutines.
**/
@:structInit
@:go.Type({ name: "Encoder", instanceName: "gob.Encoder", imports: ["encoding/gob"] })
extern class Encoder {

    /**
        Encode transmits the data item represented by the empty interface value,
        guaranteeing that all necessary type information has been transmitted first.
        Passing a nil pointer to Encoder will panic, as they cannot be transmitted by gob.
    **/
    @:native("Encode") function encode(e: Dynamic): (go.Error);
    /**
        EncodeValue transmits the data item represented by the reflection value,
        guaranteeing that all necessary type information has been transmitted first.
        Passing a nil pointer to EncodeValue will panic, as they cannot be transmitted by gob.
    **/
    @:native("EncodeValue") function encodeValue(value: go.reflect.Value): (go.Error);

}