# Concepts

The Concepts library provides compile-time validation of type constraints via
**traits** and **concepts**.

## Motivation

### Duck Typing

The problem with compile-time duck typing is that the error messages it
generates are horrible:

```console
error: no field named 'items' in '[3]u8'
    for (list.items) |v| {
             ^
note: called from here
    print([_]u8{ 1, 2, 3 });
         ^
note: called from here
    pub fn main() anyerror!void {
```

Can you guess what type `print` expect its input to be? If you said
`std.ArrayList` because you saw the `items` field access, congratulations! You
*may* be right. `print` could also expect its input to be `struct { items:
[5]bool }` or any other type with an iterable `items` field. Without more
information, *guessing* the type constraints of `print` is the best we can do.

### Type Reflection

Type reflection, on the other hand, is pretty awesome for enforcing type
constraints. For instance, by using `@TypeOf`, `@typeName`, and
`std.mem.startsWith`, we can improve our compiler error with a few lines of
code:

```console
error: expected `std.ArrayList`, found `[3]u8`
        @compileError("expected `std.ArrayList`, found `" ++ @typeName(@TypeOf(list)) ++ "`");
        ^
note: called from here
    print([_]u8{ 1, 2, 3 });

note: called from here
    pub fn main() anyerror!void {
```

Unfortunately (at least, from my experience), enforcing type constraints using
the language and standard library tends to become unwieldy and haphazard,
especially when working with complex constraints or things like generic
interfaces.

## Contributing

See [CONTRIBUTING.md](CONTRIBUTING.md) for more detail.

## License

See [LICENSE](LICENSE) for more detail.
