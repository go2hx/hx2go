package go.encoding.xml;

/**
    A Comment represents an XML comment of the form <!--comment-->.
    The bytes do not include the <!-- and --> comment markers.
**/
@:go.Type({ name: "Comment", instanceName: "xml.Comment", imports: ["encoding/xml"] })
extern class Comment {

    /**
        Copy creates a new copy of Comment.
    **/
    @:native("Copy") function copy(): (go.encoding.xml.Comment);

}