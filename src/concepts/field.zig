const concepts = @import("../lib.zig");

const concept = "Field";

pub fn field(comptime T: type, comptime name: []const u8) void {
    comptime {
        // Invariants
        concepts.container(T);

        // Constraints
        if (!concepts.traits.hasField(T, name)) {
            concepts.fail(concept, "");
        }
    }
}
