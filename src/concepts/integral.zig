const concepts = @import("../lib.zig");

const concept = "Integral";

pub fn integral(T: anytype) void {
    comptime {
        // Invariants
        concepts.same(@TypeOf(T), type);

        // Constraints
        if (!concepts.traits.isIntegral(T)) {
            concepts.fail(concept, "");
        }
    }
}
