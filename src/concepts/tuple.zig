const concepts = @import("../lib.zig");

const concept = "Tuple";

pub fn tuple(T: anytype) void {
    comptime {
        if (!concepts.traits.is(@TypeOf(T), type)) {
            concepts.err(concept, "expected type `type`, found `" ++ @typeName(@TypeOf(T)) ++ "`");
        }
    }

    comptime {
        if (!concepts.traits.isTuple(T)) {
            concepts.fail(concept, "");
        }
    }
}
