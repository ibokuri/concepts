const std = @import("std");

const package_name = "concepts";
const package_path = "src/lib.zig";

const tests = [_][]const u8{
    "src/lib.zig",
};

pub fn build(b: *std.build.Builder) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    _ = b.addModule("concepts", .{
        .source_file = .{ .path = "src/lib.zig" },
    });

    const step = b.step("test", "Run framework tests");
    for (tests) |path| {
        const t = b.addTest(.{
            .name = "test",
            .root_source_file = .{ .path = path },
            .target = target,
            .optimize = optimize,
        });

        step.dependOn(&t.step);
    }
}
