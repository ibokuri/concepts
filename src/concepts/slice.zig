const concepts = @import("../lib.zig");

const concept = "Slice";

pub fn slice(T: anytype) void {
    comptime {
        // Invariants
        concepts.same(@TypeOf(T), type);

        // Constraints
        if (!concepts.traits.isSlice(T)) {
            concepts.fail(concept, "");
        }
    }
}
