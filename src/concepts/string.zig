const concepts = @import("../lib.zig");

const concept = "String";

pub fn string(T: anytype) void {
    comptime {
        // Invariants
        concepts.same(@TypeOf(T), type);

        // Constraints
        if (!concepts.traits.isString(T)) {
            concepts.fail(concept, "");
        }
    }
}
