const std = @import("std");

pub fn isFloat(comptime T: type) bool {
    return std.meta.trait.isFloat(T);
}

test {
    comptime {
        try std.testing.expect(isFloat(comptime_float));
        try std.testing.expect(isFloat(f16));
        try std.testing.expect(isFloat(f32));
        try std.testing.expect(isFloat(f64));
        try std.testing.expect(isFloat(f128));

        try std.testing.expect(!isFloat(comptime_int));
        try std.testing.expect(!isFloat(i8));
        try std.testing.expect(!isFloat(u8));
        try std.testing.expect(!isFloat(bool));
        try std.testing.expect(!isFloat([]const u8));
    }
}
