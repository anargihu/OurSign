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
                    Label("My Apps", systemImage: "rectangle.stack.fill")
                }

            SourcesView()
                .tabItem {
                    Label("Sources", systemImage: "square.stack.3d.up.fill")
                }

            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "slider.horizontal.3")
                }
        }
        .tint(.cyan)
        .toolbarBackground(.ultraThinMaterial, for: .tabBar)
        .toolbarBackground(.visible, for: .tabBar)
    }
}
struct OurSignIcon: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 5)
                .stroke(
                    LinearGradient(
                        colors: [.cyan, .blue, .purple],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: 2
                )
                .frame(width: 22, height: 22)

            Circle()
                .stroke(.white, lineWidth: 2)
                .frame(width: 8, height: 8)

            Circle()
                .fill(.white)
                .frame(width: 3, height: 3)
        }
    }
}