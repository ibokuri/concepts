pub usingnamespace @import("concepts.zig");

pub fn require(value: anytype, comptime concept: fn (anytype) void) void {
    return concept(value);
}
