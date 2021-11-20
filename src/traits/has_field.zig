const std = @import("std");

pub fn hasField(comptime T: type, comptime name: []const u8) bool {
    return std.meta.trait.hasField(name)(T);
}

test "Field" {
    const T = struct {
        value: u32,
    };

    try std.testing.expect(hasField(T, "value"));

    try std.testing.expect(!hasField(*T, "value"));
    try std.testing.expect(!hasField(T, "x"));
    try std.testing.expect(!hasField(**T, "x"));
    try std.testing.expect(!hasField(u8, "value"));
}
