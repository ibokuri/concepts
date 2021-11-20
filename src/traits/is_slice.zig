const std = @import("std");

pub fn isSlice(comptime T: type) bool {
    return std.meta.trait.isSlice(T);
}

test {
    const array = [_]u8{0} ** 10;
    var zero: usize = 0;

    try std.testing.expect(isSlice(@TypeOf(array[zero..])));
    try std.testing.expect(!isSlice(@TypeOf(array)));
    try std.testing.expect(!isSlice(@TypeOf(&array[0])));
}
