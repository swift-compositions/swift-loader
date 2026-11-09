#if os(Windows)
    import Loader
    import Loader_Test_Support
    import Testing

    extension Loader.Symbol {
        @Suite struct Lookup {
            @Suite struct Unit {
                @Test func `lookup on Windows throws instead of trapping`() {
                    #expect(throws: Loader.Error.self) {
                        _ = try "main".withCString { name throws(Loader.Error) in
                            try unsafe Loader.Symbol.lookup(name: name, in: .default)
                        }
                    }
                }
            }
        }
    }
#endif
