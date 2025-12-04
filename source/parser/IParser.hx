package parser;

import haxe.io.Bytes;

interface IParser {
    public function run(data: Bytes): ParserInfo;
}