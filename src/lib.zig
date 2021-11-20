pub usingnamespace @import("concepts.zig");

pub const traits = struct {
    pub usingnamespace @import("traits.zig");
};

pub fn err(comptime concept: []const u8, comptime msg: []const u8) void {
    const base = "concept `" ++ concept ++ "` could not be satisfied";
    const extra = " (" ++ msg ++ ")";

    comptime {
        switch (msg.len) {
            0 => @compileError(base),
            else => @compileError(base ++ extra),
        }
    }
}

pub fn fail(comptime concept: []const u8, comptime msg: []const u8) void {
    const base = "concept `" ++ concept ++ "` was not satisfied";
    const extra = " (" ++ msg ++ ")";

    comptime {
        switch (msg.len) {
            0 => @compileError(base),
            else => @compileError(base ++ extra),
        }
    }
}
