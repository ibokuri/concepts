const std = @import("std");

pub fn containsField(comptime T: type, comptime name: []const u8) bool {
    return std.meta.trait.hasField(name)(T);
}

test "Field" {
    const T = struct {
        value: u32,
    };

    try std.testing.expect(containsField(T, "value"));

    try std.testing.expect(!containsField(*T, "value"));
    try std.testing.expect(!containsField(T, "x"));
    try std.testing.expect(!containsField(**T, "x"));
    try std.testing.expect(!containsField(u8, "value"));
}
