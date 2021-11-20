const concepts = @import("../lib.zig");

const concept = "Function";

pub fn function(comptime T: type) void {
    comptime {
        if (!concepts.traits.isFunction(T)) {
            concepts.fail(concept, "");
        }
    }
}
