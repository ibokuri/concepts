const concepts = @import("../lib.zig");

const concept = "Packed";

pub fn @"packed"(comptime T: type) void {
    comptime {
        if (!concepts.traits.isPacked(T)) {
            concepts.fail(concept, "");
        }
    }
}
