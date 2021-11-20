const concepts = @import("../lib.zig");

const concept = "Slice";

pub fn slice(comptime T: type) void {
    comptime {
        if (!concepts.traits.isSlice(T)) {
            concepts.fail(concept, "");
        }
    }
}
