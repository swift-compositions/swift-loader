#if os(Windows)

    import Loader_Vocabulary
    extension Loader.Symbol {

        @inlinable
        public static func lookup(
            name: UnsafePointer<CChar>,
            in scope: Scope
        ) throws(Loader.Error) -> UnsafeRawPointer {
            throw .symbol(
                Loader.Message(ascii: "Loader.Symbol.lookup is not supported on Windows")
            )
        }
    }
#endif
