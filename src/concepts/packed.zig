const concepts = @import("../lib.zig");

const concept = "Packed";

pub fn @"packed"(T: anytype) void {
    comptime {
        // Invariants
        concepts.same(@TypeOf(T), type);

        // Constraints
        if (!concepts.traits.isPacked(T)) {
            concepts.fail(concept, "");
        }
    }
}
