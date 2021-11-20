const concepts = @import("../lib.zig");

const concept = "Function";

pub fn function(T: anytype) void {
    comptime {
        // Invariants
        concepts.same(@TypeOf(T), type);

        // Constraints
        if (!concepts.traits.isFunction(T)) {
            concepts.fail(concept, "");
        }
    }
}
