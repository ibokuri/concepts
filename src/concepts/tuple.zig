const concepts = @import("../lib.zig");

const concept = "Tuple";

pub fn tuple(T: anytype) void {
    comptime {
        // Invariants
        concepts.is(@TypeOf(T), type);

        // Constraints
        if (!concepts.traits.isTuple(T)) {
            concepts.fail(concept, "");
        }
    }
}
