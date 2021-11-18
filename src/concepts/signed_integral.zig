const concepts = @import("../lib.zig");

const concept = "SignedIntegral";

pub fn signedIntegral(T: anytype) void {
    comptime {
        // Invariants
        concepts.is(.{ @TypeOf(T), type });

        // Constraints
        if (!concepts.traits.isSignedIntegral(T)) {
            concepts.fail(concept, "type `" ++ @typeName(T) ++ "` is not a signed integral type");
        }
    }
}
