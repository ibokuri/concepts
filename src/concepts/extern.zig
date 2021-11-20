const concepts = @import("../lib.zig");

const concept = "Extern";

pub fn @"extern"(comptime T: type) void {
    comptime {
        if (!concepts.traits.isExtern(T)) {
            concepts.fail(concept, "");
        }
    }
}
