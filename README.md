# swift-loader

Use this package when a program must find, at run time, Swift types or binary metadata sections in the images loaded into its own process, such as plugin types in a library opened at run time, without any registration. Start from `Loader.types(named:)` to find types and `Loader.Section.all(_:)` to read a named section from every image. If you only need the shared section, library and symbol values to write a loader binding of your own, use swift-loader-vocabulary.

## Laws

- `Loader.types(named:)` and `Loader.Section.all(_:)` read the loaded images again on every call. Nothing is cached, so an image loaded later is seen by the next call.
- `Loader.types(named:)` matches a type when its own name, without the enclosing types or module, contains the text, compared byte for byte and case-sensitively. Generic types are never returned. The metadata of every matching type is instantiated as it is found.
- Type and section discovery work only on Apple platforms. On Linux the tests pin both to return nothing, and on any other platform `Loader.Section.all(_:)` is empty.
- On Windows, `Loader.Symbol.lookup(name:in:)` traps instead of throwing.
