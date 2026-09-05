import SwiftUI

struct SourcesView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("OurSign Sources") {
                    Label("OurSign", systemImage: "checkmark.seal.fill")
                }

                Section("AltStore Sources") {
                    ContentUnavailableView(
                        "No Sources",
                        systemImage: "square.stack.3d.up",
                        description: Text("Add an AltStore-compatible source.")
                    )
                }

                Section {
                    Button {
                    } label: {
                        Label("Add Source", systemImage: "plus")
                    }
                }
            }
            .navigationTitle("Sources")
        }
    }
}