const std = @import("std");

pub fn isFunction(comptime T: type) bool {
    return @typeInfo(T) == .Fn;
}

test {
    comptime {
        try std.testing.expect(isFunction(fn () void));
        try std.testing.expect(!isFunction(i32));
    }
}
