const std = @import("std");

const assert = std.debug.assert;
const expect = std.testing.expect;

pub usingnamespace @import("concepts/integral.zig");
pub usingnamespace @import("concepts/signed_integral.zig");
pub usingnamespace @import("concepts/unsigned_integral.zig");

pub fn require(value: anytype, comptime concept: fn (anytype) void) void {
    return concept(value);
}
