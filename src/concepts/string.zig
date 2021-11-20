const concepts = @import("../lib.zig");

const concept = "String";

pub fn string(comptime T: type) void {
    comptime {
        if (!concepts.traits.isString(T)) {
            concepts.fail(concept, "");
        }
    }
}
