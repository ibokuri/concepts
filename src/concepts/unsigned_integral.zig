const concepts = @import("../lib.zig");

const concept = "UnsignedIntegral";

pub fn unsignedIntegral(T: anytype) void {
    comptime {
        // Invariants
        concepts.is(.{ @TypeOf(T), type });

        // Constraints
        if (!concepts.traits.isIntegral(T) or concepts.traits.isSignedIntegral(T)) {
            concepts.fail(concept, "type `" ++ @typeName(T) ++ "` is not an unsigned integral type");
        }
    }
}
