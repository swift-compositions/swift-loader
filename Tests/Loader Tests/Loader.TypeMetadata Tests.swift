import Loader
import Loader_Test_Support
import Testing

enum `Loader Tests` {}

extension `Loader Tests` {
    @Suite struct Tests {

        struct MetadataDiscoveryProbe {}

        @Suite struct Unit {
            @Test func `a type declared in this module is discoverable by name`() {
                let found = Loader.types(named: "MetadataDiscoveryProbe")

                #if canImport(Darwin)
                    #expect(
                        found.contains { $0 == `Loader Tests`.Tests.MetadataDiscoveryProbe.self },
                        "The probe type must be recoverable from the type metadata section"
                    )
                #else
                    #expect(found.isEmpty)
                #endif
            }

            @Test func `a name matched by no type yields no results`() {
                #expect(Loader.types(named: "NoTypeAnywhereCarriesThisName_9F3A1C").isEmpty)
            }

            @Test func `discovery is repeatable`() {
                let first = Loader.types(named: "MetadataDiscoveryProbe").count
                let second = Loader.types(named: "MetadataDiscoveryProbe").count
                #expect(first == second)
            }
        }
    }
}
