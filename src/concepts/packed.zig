const concepts = @import("../lib.zig");

const concept = "Packed";

pub fn @"packed"(T: anytype) void {
    comptime {
        // Invariants
        concepts.is(.{ @TypeOf(T), type });

        // Constraints
        if (!concepts.traits.isPacked(T)) {
            concepts.fail(concept, "type `" ++ @typeName(T) ++ "` is not marked as `packed`");
        }
    }
}
