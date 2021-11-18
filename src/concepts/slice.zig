const concepts = @import("../lib.zig");

const concept = "Slice";

pub fn slice(T: anytype) void {
    comptime {
        if (!concepts.traits.is(@TypeOf(T), type)) {
            concepts.err(concept, "expected type `type`, found `" ++ @typeName(@TypeOf(T)) ++ "`");
        }
    }

    comptime {
        if (!concepts.traits.isSlice(T)) {
            concepts.fail(concept, "");
        }
    }
}
