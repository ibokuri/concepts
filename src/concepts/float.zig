const concepts = @import("../lib.zig");

const concept = "Float";

pub fn float(value: anytype) void {
    comptime {
        if (!concepts.traits.isFloat(@TypeOf(value))) {
            concepts.fail(concept, "");
        }
    }
}
