const concepts = @import("../lib.zig");

const concept = "SignedIntegral";

pub fn signedIntegral(T: anytype) void {
    comptime {
        // Invariants
        concepts.same(@TypeOf(T), type);

        // Constraints
        if (!concepts.traits.isSignedIntegral(T)) {
            concepts.fail(concept, "");
        }
    }
}
