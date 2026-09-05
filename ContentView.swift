import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            BrowseView()
                .tabItem {
                    Label("Browse", systemImage: "square.grid.2x2.fill")
                }

            AppsView()
                .tabItem {
                    Label("My Apps", systemImage: "apps.iphone")
                }

            SourcesView()
                .tabItem {
                    Label("Sources", systemImage: "square.stack.3d.up.fill")
                }

            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }
        .tint(.cyan)
    }
}