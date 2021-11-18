const concepts = @import("../lib.zig");

const concept = "Float";

pub fn float(T: anytype) void {
    comptime {
        // Invariants
        concepts.is(.{ @TypeOf(T), type });

        // Constraints
        if (!concepts.traits.isFloat(T)) {
            concepts.fail(concept, "type `" ++ @typeName(T) ++ "` is not a floating-point type");
        }
    }
}
