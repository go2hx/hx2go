package go.encoding.json;

/**
    A Token holds a value of one of these types:
    
      - [Delim], for the four JSON delimiters [ ] { }
      - bool, for JSON booleans
      - float64, for JSON numbers
      - [Number], for JSON numbers
      - string, for JSON string literals
      - nil, for JSON null
**/
@:go.Type({ name: "Token", instanceName: "json.Token", imports: ["encoding/json"] })
extern typedef Token = {

}