package recordparser;

import parser.dump.RecordParser;
import sys.io.File;

function run() {
    final filePath = "tests/recordparser/LexEngineField.dump";
    final parser:RecordParser = {dbg_path: filePath, input: Util.normalizeCLRF(File.getContent(filePath))};
    final record = parser.run();
    final cl = record.toClass();
    assert(cl.ordered_statics.length, 1);
    assert(cl.ordered_statics[0].kind, "method");
}