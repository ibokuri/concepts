const std = @import("std");

pub fn isIntegral(comptime T: type) bool {
    return std.meta.trait.isIntegral(T);
}

test "Integral" {
    comptime {
        try std.testing.expect(isIntegral(comptime_int));
        try std.testing.expect(isIntegral(i8));
        try std.testing.expect(isIntegral(u8));

        try std.testing.expect(!isIntegral(bool));
        try std.testing.expect(!isIntegral(f32));
        try std.testing.expect(!isIntegral([]const u8));
    }
}
