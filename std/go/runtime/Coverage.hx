package go.runtime;

/**
    Package coverage contains APIs for writing coverage profile data at runtime
    from long-running and/or server programs that do not terminate via [os.Exit].
**/
@:go.Type({ name: "coverage", instanceName: "coverage.coverage", imports: ["runtime/coverage"] })
extern class Coverage {

    /**
        ClearCounters clears/resets all coverage counter variables in the
        currently running program. It returns an error if the program in
        question was not built with the "-cover" flag. Clearing of coverage
        counters is also not supported for programs not using atomic
        counter mode (see more detailed comments below for the rationale
        here).
    **/
    @:native("ClearCounters") static function clearCounters(): (go.Error);
    /**
        WriteCounters writes coverage counter-data content for the
        currently running program to the writer 'w'. An error will be
        returned if the operation can't be completed successfully (for
        example, if the currently running program was not built with
        "-cover", or if a write fails). The counter data written will be a
        snapshot taken at the point of the invocation.
    **/
    @:native("WriteCounters") static function writeCounters(w: go.io.Writer): (go.Error);
    /**
        WriteCountersDir writes a coverage counter-data file for the
        currently running program to the directory specified in 'dir'. An
        error will be returned if the operation can't be completed
        successfully (for example, if the currently running program was not
        built with "-cover", or if the directory does not exist). The
        counter data written will be a snapshot taken at the point of the
        call.
    **/
    @:native("WriteCountersDir") static function writeCountersDir(dir: String): (go.Error);
    /**
        WriteMeta writes the meta-data content (the payload that would
        normally be emitted to a meta-data file) for the currently running
        program to the writer 'w'. An error will be returned if the
        operation can't be completed successfully (for example, if the
        currently running program was not built with "-cover", or if a
        write fails).
    **/
    @:native("WriteMeta") static function writeMeta(w: go.io.Writer): (go.Error);
    /**
        WriteMetaDir writes a coverage meta-data file for the currently
        running program to the directory specified in 'dir'. An error will
        be returned if the operation can't be completed successfully (for
        example, if the currently running program was not built with
        "-cover", or if the directory does not exist).
    **/
    @:native("WriteMetaDir") static function writeMetaDir(dir: String): (go.Error);

}