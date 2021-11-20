const concepts = @import("../lib.zig");

const concept = "Tuple";

pub fn tuple(comptime T: type) void {
    comptime {
        if (!concepts.traits.isTuple(T)) {
            concepts.fail(concept, "");
        }
    }
}
