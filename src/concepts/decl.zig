const concepts = @import("../lib.zig");

const concept = "Decl";

pub fn decl(comptime T: type, comptime name: []const u8) void {
    comptime {
        // Invariants
        concepts.container(T);

        // Constraints
        if (!concepts.traits.hasDecl(T, name)) {
            concepts.fail(concept, "");
        }
    }
}
