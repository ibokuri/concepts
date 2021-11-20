const concepts = @import("../lib.zig");

const concept = "Extern";

pub fn @"extern"(T: anytype) void {
    comptime {
        // Invariants
        concepts.same(@TypeOf(T), type);

        // Constraints
        if (!concepts.traits.isExtern(T)) {
            concepts.fail(concept, "");
        }
    }
}
