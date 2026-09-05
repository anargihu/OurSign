import SwiftUI

struct SettingsView: View {
    var body: some View {
        NavigationStack {
            List {
                Section("OurSign") {
                    Label("OurSign", systemImage: "app.fill")
                    HStack {
                        Text("Version")
                        Spacer()
                        Text("0.1.0")
                            .foregroundStyle(.secondary)
                    }
                }

                Section("Sources") {
                    Label("AltStore Sources", systemImage: "square.stack.3d.up")
                }

                Section("About") {
                    Label("About OurSign", systemImage: "info.circle")
                }
            }
            .navigationTitle("Settings")
        }
    }
}