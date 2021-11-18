const concepts = @import("../lib.zig");

const concept = "Extern";

pub fn @"extern"(T: anytype) void {
    comptime {
        if (!concepts.traits.is(@TypeOf(T), type)) {
            concepts.err(concept, "expected type `type`, found `" ++ @typeName(@TypeOf(T)) ++ "`");
        }
    }

    comptime {
        if (!concepts.traits.isExtern(T)) {
            concepts.fail(concept, "");
        }
    }
}
