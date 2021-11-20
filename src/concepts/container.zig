const concepts = @import("../lib.zig");

const concept = "Container";

pub fn container(T: anytype) void {
    comptime {
        // Invariants
        concepts.same(@TypeOf(T), type);

        // Constraints
        if (!concepts.traits.isContainer(T)) {
            concepts.fail(concept, "");
        }
    }
}
