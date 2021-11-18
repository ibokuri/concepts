pub usingnamespace @import("concepts.zig");

pub const traits = struct {
    pub usingnamespace @import("traits.zig");
};

pub fn require(comptime concept: fn (anytype) void, value: anytype) void {
    return concept(value);
}

pub fn requires(concepts: anytype, value: anytype) void {
    require(@This().tuple, concepts);

    inline for (concepts) |concept| {
        require(@This().is, .{ concept, fn (anytype) void });
        require(concept, value);
    }
}

pub fn fail(comptime concept: []const u8, comptime msg: []const u8) void {
    const base = "concept `" ++ concept ++ "` was not satisfied";
    const extra = " (" ++ msg ++ ")";

    switch (msg.len) {
        0 => @compileError(base),
        else => @compileError(base ++ extra),
    }
}

pub fn err(comptime concept: []const u8, comptime msg: []const u8) void {
    const base = "concept `" ++ concept ++ "` could not be satisfied";
    const extra = " (" ++ msg ++ ")";

    switch (msg.len) {
        0 => @compileError(base),
        else => @compileError(base ++ extra),
    }
}
