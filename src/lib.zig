pub usingnamespace @import("concepts.zig");

pub fn require(value: anytype, comptime concept: fn (anytype) void) void {
    return concept(value);
}

/// TODO: Check that the elements of `concept` are `fn (anytype void)`.
pub fn requires(value: anytype, concepts: anytype) void {
    require(concepts, @This().tuple);

    inline for (concepts) |concept| {
        require(value, concept);
    }
}
