const concepts = @import("../lib.zig");

const concept = "Float";

pub fn float(T: anytype) void {
    comptime {
        // Invariants
        concepts.same(@TypeOf(T), type);

        // Constraints
        if (!concepts.traits.isFloat(T)) {
            concepts.fail(concept, "");
        }
    }
}
