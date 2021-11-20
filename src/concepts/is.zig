const concepts = @import("../lib.zig");

const concept = "Same";

pub fn same(comptime A: type, comptime B: type) void {
    comptime {
        if (!concepts.traits.isSame(A, B)) {
            concepts.fail(concept, "");
        }
    }
}
