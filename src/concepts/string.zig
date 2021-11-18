const concepts = @import("../lib.zig");

const concept = "String";

pub fn string(T: anytype) void {
    comptime {
        if (!concepts.traits.is(@TypeOf(T), type)) {
            concepts.err(concept, "expected type `type`, found `" ++ @typeName(@TypeOf(T)) ++ "`");
        }
    }

    comptime {
        if (!concepts.traits.isString(T)) {
            concepts.fail(concept, "");
        }
    }
}
