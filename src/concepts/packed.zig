const concepts = @import("../lib.zig");

const concept = "Packed";

pub fn @"packed"(T: anytype) void {
    comptime {
        if (!concepts.traits.is(@TypeOf(T), type)) {
            concepts.err(concept, "expected type `type`, found `" ++ @typeName(@TypeOf(T)) ++ "`");
        }
    }

    comptime {
        if (!concepts.traits.isPacked(T)) {
            concepts.fail(concept, "");
        }
    }
}
