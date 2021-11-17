const std = @import("std");

pub fn isSignedIntegral(comptime T: type) bool {
    return std.meta.trait.isSignedInt(T);
}

test "Integral" {
    comptime {
        try std.testing.expect(isSignedIntegral(comptime_int));
        try std.testing.expect(isSignedIntegral(i8));

        try std.testing.expect(!isSignedIntegral(u8));
        try std.testing.expect(!isSignedIntegral(bool));
        try std.testing.expect(!isSignedIntegral(f32));
        try std.testing.expect(!isSignedIntegral([]const u8));
    }
}
