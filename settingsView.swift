import SwiftUI

struct SettingsView: View {
    @State private var wireGuardEnabled = false

    var body: some View {
        NavigationStack {
            List {
                Section("WireGuard") {
                    Toggle("WireGuard", isOn: $wireGuardEnabled)

                    NavigationLink {
                        WireGuardView()
                    } label: {
                        HStack {
                            Text("Tunnel")
                            Spacer()
                            Text("OurSign")
                                .foregroundStyle(.secondary)
                        }
                    }

                    HStack {
                        Text("Status")
                        Spacer()
                        Text(wireGuardEnabled ? "Disconnected" : "Disabled")
                            .foregroundStyle(.secondary)
                    }
                }

                Section("OurSign") {
                    Label("OurSign", systemImage: "app.fill")

                    HStack {
                        Text("Version")
                        Spacer()
                        Text("0.0.1")
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

struct WireGuardView: View {
    var body: some View {
        List {
            Section("Tunnel") {
                HStack {
                    Text("Name")
                    Spacer()
                    Text("OurSign")
                        .foregroundStyle(.secondary)
                }

                HStack {
                    Text("Status")
                    Spacer()
                    Text("Disconnected")
                        .foregroundStyle(.secondary)
                }
            }

            Section("Configuration") {
                Text("Interface")
                Text("Peer")
            }
        }
        .navigationTitle("WireGuard")
    }
}