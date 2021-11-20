const concepts = @import("../lib.zig");

const concept = "Is";

pub fn is(comptime A: type, comptime B: type) void {
    comptime {
        if (!concepts.traits.isSame(A, B)) {
            concepts.fail(concept, "");
        }
    }
}
