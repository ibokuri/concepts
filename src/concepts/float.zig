const concepts = @import("../lib.zig");

const name = "Float";

pub fn float(value: anytype) void {
    if (comptime !concepts.traits.isFloat(@TypeOf(value))) {
        concepts.fail(name, "");
    }
}
