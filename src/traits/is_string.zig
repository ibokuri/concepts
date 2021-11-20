const std = @import("std");

pub fn isString(comptime T: type) bool {
    return std.meta.trait.isZigString(T);
}

test {
    try std.testing.expect(isString([]const u8));
    try std.testing.expect(isString([]u8));
    try std.testing.expect(isString([:0]const u8));
    try std.testing.expect(isString([:0]u8));
    try std.testing.expect(isString([:5]const u8));
    try std.testing.expect(isString([:5]u8));
    try std.testing.expect(isString(*const [0]u8));
    try std.testing.expect(isString(*[0]u8));
    try std.testing.expect(isString(*const [0:0]u8));
    try std.testing.expect(isString(*[0:0]u8));
    try std.testing.expect(isString(*const [0:5]u8));
    try std.testing.expect(isString(*[0:5]u8));
    try std.testing.expect(isString(*const [10]u8));
    try std.testing.expect(isString(*[10]u8));
    try std.testing.expect(isString(*const [10:0]u8));
    try std.testing.expect(isString(*[10:0]u8));
    try std.testing.expect(isString(*const [10:5]u8));
    try std.testing.expect(isString(*[10:5]u8));

    try std.testing.expect(!isString(u8));
    try std.testing.expect(!isString([4]u8));
    try std.testing.expect(!isString([4:0]u8));
    try std.testing.expect(!isString([*]const u8));
    try std.testing.expect(!isString([*]const [4]u8));
    try std.testing.expect(!isString([*c]const u8));
    try std.testing.expect(!isString([*c]const [4]u8));
    try std.testing.expect(!isString([*:0]const u8));
    try std.testing.expect(!isString([*:0]const u8));
    try std.testing.expect(!isString(*[]const u8));
    try std.testing.expect(!isString(?[]const u8));
    try std.testing.expect(!isString(?*const [4]u8));
    try std.testing.expect(!isString([]allowzero u8));
    try std.testing.expect(!isString([]volatile u8));
    try std.testing.expect(!isString(*allowzero [4]u8));
    try std.testing.expect(!isString(*volatile [4]u8));
}
