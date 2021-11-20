const concepts = @import("../lib.zig");

const concept = "Float";

pub fn float(comptime T: type) void {
    comptime {
        // Invariants
        concepts.same(@TypeOf(T), type);

        // Constraints
        if (!concepts.traits.isFloat(T)) {
            concepts.fail(concept, "");
        }
    }
}
