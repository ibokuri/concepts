const concepts = @import("../lib.zig");

const concept = "Extern";

pub fn @"extern"(T: anytype) void {
    comptime {
        // Invariants
        concepts.is(@TypeOf(T), type);

        // Constraints
        if (!concepts.traits.isExtern(T)) {
            concepts.fail(concept, "");
        }
    }
}
