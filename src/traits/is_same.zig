const std = @import("std");

pub fn isSame(comptime A: type, comptime B: type) bool {
    return A == B;
}

test "Is" {
    comptime {
        try std.testing.expect(isSame(@TypeOf(1), comptime_int));
        try std.testing.expect(isSame(@TypeOf(1.0), comptime_float));
        try std.testing.expect(isSame(@TypeOf(true), bool));

        try std.testing.expect(!isSame(@TypeOf(1), i32));
        try std.testing.expect(!isSame(@TypeOf(1.0), f64));
        try std.testing.expect(!isSame(@TypeOf("true"), bool));
    }
}
