const concepts = @import("../lib.zig");

const concept = "String";

pub fn string(value: anytype) void {
    comptime {
        if (!concepts.traits.isString(@TypeOf(value))) {
            concepts.fail(concept, "");
        }
    }
}
