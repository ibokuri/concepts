# Concepts

The Concepts library provides compile-time validation of type constraints via
**traits** and **concepts**.

## API Reference

### `concepts`

#### [General](src/lib.zig)

- `fail` - Generates a compile error due to a concept being unsatisfied.
- `err` - Generates a compile error due to an error during concept validation.
- `require` - Validates a concept.
- `requires` - Validates one or more concepts.

#### [Concepts](src/concepts)

- `arrayList` - Specifies that a type is a `std.ArrayList` type.
- `container` - Specifies that a type is a container type.
- `decl` - Specifies that a type contains a given declaration.
- `extern` - Specifies that a type has an `extern` in-memory layout.
- `field` - Specifies that a type contains a given field.
- `float` - Specifies that a type is a floating-point type.
- `integral` - Specifies that a type is an integral type.
- `is` - Specifies that a type is the same as another type.
- `packed` - Specifies that a type has a `packed` in-memory layout.
- `signedIntegral` - Specifies that a type is an integral type that is signed.
- `slice` - Specifies that a type is a slice type.
- `string` - Specifies that a type is a string type.
- `tuple` - Specifies that a type is a tuple type.
- `unsignedIntegral` - Specifies that a type is an integral type that is unsigned.

### `concepts.traits`

#### [Traits](src/traits)

- `containsDecl` - Checks if a type contains a given declaration.
- `containsField` - Checks if a type contains a given field.
- `is` - Checks if two types are equal.
- `isContainer` - Checks if a type is a container type.
- `isExtern` - Checks if a type has an `extern` in-memory layout.
- `isFloat` - Checks if a type is a floating-point type.
- `isIntegral` - Checks if a type is an integral type.
- `isPacked` - Checks if a type has a `packed` in-memory layout.
- `isSignedIntegral` - Checks if a type is an integral type that is signed.
- `isSlice` - Checks if a type is a slice type.
- `isString` - Checks if a type is a string type.
- `isTuple` - Checks if a type is a tuple type.
- `isUnsignedIntegral` - Checks if a type is an integral type that is unsigned.

## Motivation

### Duck Typing

The problem with compile-time duck typing is that the error messages it
generates are horrible:

```
error: no field named 'items' in '[3]u8'
    for (list.items) |v| {

note: called from here
    print([_]u8{ 1, 2, 3 });

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

```
error: expected `std.ArrayList`, found `[3]u8`
    @compileError("expected `std.ArrayList`, found `" ++ @typeName(@TypeOf(list)) ++ "`");

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
