const std = @import("std");

pub fn startsWith(str: []const u8, prefix: []const u8) bool {
    return std.mem.startsWith(u8, str, prefix);
}

test "StartsWith" {
    comptime {
        try std.testing.expect(startsWith("Bob", "Bo"));
        try std.testing.expect(!startsWith("Needle in haystack", "haystack"));
    }
}
