package go.go.doc;

@:go.Type({ name: "comment", instanceName: "comment.comment", imports: ["go/doc/comment"] })
extern class Comment {

    @:go.Tuple("importPath", "ok") @:native("DefaultLookupPackage") static function defaultLookupPackage(name: String): (go.Tuple<{ importPath: String, ok: Bool }>);

}