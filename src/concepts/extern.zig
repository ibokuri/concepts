const concepts = @import("../lib.zig");

const concept = "Extern";

pub fn @"extern"(value: anytype) void {
    comptime {
        if (!concepts.traits.isExtern(@TypeOf(value))) {
            concepts.fail(concept, "");
        }
    }
}
