const concepts = @import("../lib.zig");

const concept = "Packed";

pub fn @"packed"(value: anytype) void {
    comptime {
        if (!concepts.traits.isPacked(@TypeOf(value))) {
            concepts.fail(concept, "");
        }
    }
}
