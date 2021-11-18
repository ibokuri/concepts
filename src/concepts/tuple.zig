const concepts = @import("../lib.zig");

const concept = "Tuple";

pub fn tuple(value: anytype) void {
    comptime {
        if (!concepts.traits.isTuple(@TypeOf(value))) {
            concepts.fail(concept, "");
        }
    }
}
