const std = @import("std");

pub fn containsField(comptime name: []const u8, comptime T: type) bool {
    return std.meta.trait.hasField(name)(T);
}

test "Field" {
    const T = struct {
        value: u32,
    };

    try std.testing.expect(containsField("value", T));

    try std.testing.expect(!containsField("value", *T));
    try std.testing.expect(!containsField("x", T));
    try std.testing.expect(!containsField("x", **T));
    try std.testing.expect(!containsField("value", u8));
}
