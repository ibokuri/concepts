const concepts = @import("../lib.zig");

const concept = "Method";

pub fn method(comptime T: type, comptime name: []const u8) void {
    comptime {
        // Invariants
        concepts.container(T);

        // Constraints
        if (!concepts.traits.hasFunction(T, name)) {
            concepts.fail(concept, "");
        }
    }
}
