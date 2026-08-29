package go.encoding;

/**
    Package xml implements a simple XML 1.0 parser that
    understands XML name spaces.
**/
@:go.Type({ name: "xml", instanceName: "xml.xml", imports: ["encoding/xml"] })
extern class Xml {

    @:native("Header") static var header: String;

    /**
        HTMLAutoClose is the set of HTML elements that
        should be considered to close automatically.
        
        See the [Decoder.Strict] and [Decoder.Entity] fields' documentation.
    **/
    @:native("HTMLAutoClose") static var hTMLAutoClose: go.Slice<String>;
    /**
        HTMLEntity is an entity map containing translations for the
        standard HTML entity characters.
        
        See the [Decoder.Strict] and [Decoder.Entity] fields' documentation.
    **/
    @:native("HTMLEntity") static var hTMLEntity: go.Map<String, String>;

    /**
        CopyToken returns a copy of a Token.
    **/
    @:native("CopyToken") static function copyToken(t: go.encoding.xml.Token): (go.encoding.xml.Token);
    /**
        Escape is like [EscapeText] but omits the error return value.
        It is provided for backwards compatibility with Go 1.0.
        Code targeting Go 1.1 or later should use [EscapeText].
    **/
    @:native("Escape") static function escape(w: go.io.Writer, s: go.Slice<go.Byte>): Void;
    /**
        EscapeText writes to w the properly escaped XML equivalent
        of the plain text data s.
    **/
    @:native("EscapeText") static function escapeText(w: go.io.Writer, s: go.Slice<go.Byte>): (go.Error);
    /**
        Marshal returns the XML encoding of v.
        
        Marshal handles an array or slice by marshaling each of the elements.
        Marshal handles a pointer by marshaling the value it points at or, if the
        pointer is nil, by writing nothing. Marshal handles an interface value by
        marshaling the value it contains or, if the interface value is nil, by
        writing nothing. Marshal handles all other data by writing one or more XML
        elements containing the data.
        
        The name for the XML elements is taken from, in order of preference:
          - the tag on the XMLName field, if the data is a struct
          - the value of the XMLName field of type [Name]
          - the tag of the struct field used to obtain the data
          - the name of the struct field used to obtain the data
          - the name of the marshaled type
        
        The XML element for a struct contains marshaled elements for each of the
        exported fields of the struct, with these exceptions:
          - the XMLName field, described above, is omitted.
          - a field with tag "-" is omitted.
          - a field with tag "name,attr" becomes an attribute with
            the given name in the XML element.
          - a field with tag ",attr" becomes an attribute with the
            field name in the XML element.
          - a field with tag ",chardata" is written as character data,
            not as an XML element.
          - a field with tag ",cdata" is written as character data
            wrapped in one or more <![CDATA[ ... ]]> tags, not as an XML element.
          - a field with tag ",innerxml" is written verbatim, not subject
            to the usual marshaling procedure.
          - a field with tag ",comment" is written as an XML comment, not
            subject to the usual marshaling procedure. It must not contain
            the "--" string within it.
          - a field with a tag including the "omitempty" option is omitted
            if the field value is empty. The empty values are false, 0, any
            nil pointer or interface value, and any array, slice, map, or
            string of length zero.
          - an anonymous struct field is handled as if the fields of its
            value were part of the outer struct.
          - an anonymous struct field of interface type is treated the same as having
            that type as its name, rather than being anonymous.
          - a field implementing [Marshaler] is written by calling its MarshalXML
            method.
          - a field implementing [encoding.TextMarshaler] is written by encoding the
            result of its MarshalText method as text.
        
        If a field uses a tag "a>b>c", then the element c will be nested inside
        parent elements a and b. Fields that appear next to each other that name
        the same parent will be enclosed in one XML element.
        
        If the XML name for a struct field is defined by both the field tag and the
        struct's XMLName field, the names must match.
        
        See [MarshalIndent] for an example.
        
        Marshal will return an error if asked to marshal a channel, function, or map.
    **/
    @:native("Marshal") static function marshal(v: Dynamic): (go.Result<go.Slice<go.Byte>>);
    /**
        MarshalIndent works like [Marshal], but each XML element begins on a new
        indented line that starts with prefix and is followed by one or more
        copies of indent according to the nesting depth.
    **/
    @:native("MarshalIndent") static function marshalIndent(v: Dynamic, prefix: String, indent: String): (go.Result<go.Slice<go.Byte>>);
    /**
        NewDecoder creates a new XML parser reading from r.
        If r does not implement [io.ByteReader], NewDecoder will
        do its own buffering.
    **/
    @:native("NewDecoder") static function newDecoder(r: go.io.Reader): (go.Pointer<go.encoding.xml.Decoder>);
    /**
        NewEncoder returns a new encoder that writes to w.
    **/
    @:native("NewEncoder") static function newEncoder(w: go.io.Writer): (go.Pointer<go.encoding.xml.Encoder>);
    /**
        NewTokenDecoder creates a new XML parser using an underlying token stream.
    **/
    @:native("NewTokenDecoder") static function newTokenDecoder(t: go.encoding.xml.TokenReader): (go.Pointer<go.encoding.xml.Decoder>);
    /**
        Unmarshal parses the XML-encoded data and stores the result in
        the value pointed to by v, which must be an arbitrary struct,
        slice, or string. Well-formed data that does not fit into v is
        discarded.
        
        Because Unmarshal uses the reflect package, it can only assign
        to exported (upper case) fields. Unmarshal uses a case-sensitive
        comparison to match XML element names to tag values and struct
        field names.
        
        Unmarshal maps an XML element to a struct using the following rules.
        In the rules, the tag of a field refers to the value associated with the
        key 'xml' in the struct field's tag (see the example above).
        
          - If the struct has a field of type []byte or string with tag
            ",innerxml", Unmarshal accumulates the raw XML nested inside the
            element in that field. The rest of the rules still apply.
        
          - If the struct has a field named XMLName of type Name,
            Unmarshal records the element name in that field.
        
          - If the XMLName field has an associated tag of the form
            "name" or "namespace-URL name", the XML element must have
            the given name (and, optionally, name space) or else Unmarshal
            returns an error.
        
          - If the XML element has an attribute whose name matches a
            struct field name with an associated tag containing ",attr" or
            the explicit name in a struct field tag of the form "name,attr",
            Unmarshal records the attribute value in that field.
        
          - If the XML element has an attribute not handled by the previous
            rule and the struct has a field with an associated tag containing
            ",any,attr", Unmarshal records the attribute value in the first
            such field.
        
          - If the XML element contains character data, that data is
            accumulated in the first struct field that has tag ",chardata".
            The struct field may have type []byte or string.
            If there is no such field, the character data is discarded.
        
          - If the XML element contains comments, they are accumulated in
            the first struct field that has tag ",comment".  The struct
            field may have type []byte or string. If there is no such
            field, the comments are discarded.
        
          - If the XML element contains a sub-element whose name matches
            the prefix of a tag formatted as "a" or "a>b>c", unmarshal
            will descend into the XML structure looking for elements with the
            given names, and will map the innermost elements to that struct
            field. A tag starting with ">" is equivalent to one starting
            with the field name followed by ">".
        
          - If the XML element contains a sub-element whose name matches
            a struct field's XMLName tag and the struct field has no
            explicit name tag as per the previous rule, unmarshal maps
            the sub-element to that struct field.
        
          - If the XML element contains a sub-element whose name matches a
            field without any mode flags (",attr", ",chardata", etc), Unmarshal
            maps the sub-element to that struct field.
        
          - If the XML element contains a sub-element that hasn't matched any
            of the above rules and the struct has a field with tag ",any",
            unmarshal maps the sub-element to that struct field.
        
          - An anonymous struct field is handled as if the fields of its
            value were part of the outer struct.
        
          - A struct field with tag "-" is never unmarshaled into.
        
        If Unmarshal encounters a field type that implements the Unmarshaler
        interface, Unmarshal calls its UnmarshalXML method to produce the value from
        the XML element.  Otherwise, if the value implements
        [encoding.TextUnmarshaler], Unmarshal calls that value's UnmarshalText method.
        
        Unmarshal maps an XML element to a string or []byte by saving the
        concatenation of that element's character data in the string or
        []byte. The saved []byte is never nil.
        
        Unmarshal maps an attribute value to a string or []byte by saving
        the value in the string or slice.
        
        Unmarshal maps an attribute value to an [Attr] by saving the attribute,
        including its name, in the Attr.
        
        Unmarshal maps an XML element or attribute value to a slice by
        extending the length of the slice and mapping the element or attribute
        to the newly created value.
        
        Unmarshal maps an XML element or attribute value to a bool by
        setting it to the boolean value represented by the string. Whitespace
        is trimmed and ignored.
        
        Unmarshal maps an XML element or attribute value to an integer or
        floating-point field by setting the field to the result of
        interpreting the string value in decimal. There is no check for
        overflow. Whitespace is trimmed and ignored.
        
        Unmarshal maps an XML element to a Name by recording the element
        name.
        
        Unmarshal maps an XML element to a pointer by setting the pointer
        to a freshly allocated value and then mapping the element to that value.
        
        A missing element or empty attribute value will be unmarshaled as a zero value.
        If the field is a slice, a zero value will be appended to the field. Otherwise, the
        field will be set to its zero value.
    **/
    @:native("Unmarshal") static function unmarshal(data: go.Slice<go.Byte>, v: Dynamic): (go.Error);

}