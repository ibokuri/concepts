const std = @import("std");

pub fn isTuple(comptime T: type) bool {
    return std.meta.trait.isTuple(T);
}

test "Tuple" {
    comptime {
        try std.testing.expect(isTuple(std.meta.Tuple(&.{ i8, u8 })));

        try std.testing.expect(!isTuple(i8));
        try std.testing.expect(!isTuple(u8));
        try std.testing.expect(!isTuple(bool));
        try std.testing.expect(!isTuple(f32));
        try std.testing.expect(!isTuple([]const u8));
        try std.testing.expect(!isTuple(struct { x: i32, y: i32 }));
    }
}
