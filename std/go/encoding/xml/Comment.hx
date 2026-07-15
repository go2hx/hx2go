package go.encoding.xml;

@:go.Type({ name: "Comment", instanceName: "xml.Comment", imports: ["encoding/xml"] })
extern class Comment {

    @:native("Copy") function copy(): go.encoding.xml.Comment;

}