const concepts = @import("../lib.zig");

const concept = "Slice";

pub fn slice(value: anytype) void {
    comptime {
        if (!concepts.traits.isSlice(@TypeOf(value))) {
            concepts.fail(concept, "");
        }
    }
}
