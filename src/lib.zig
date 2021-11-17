pub usingnamespace @import("concepts.zig");

pub fn require(comptime concept: fn (anytype) void, value: anytype) void {
    return concept(value);
}

pub fn requires(value: anytype, concepts: anytype) void {
    require(@This().tuple, concepts);

    inline for (concepts) |concept| {
        require(@This().is, .{ concept, fn (anytype) void });
        require(concept, value);
    }
}
