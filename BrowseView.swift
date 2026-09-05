import SwiftUI

struct BrowseView: View {
    let apps = [
        AppItem(name: "Example App", developer: "OurSign", subtitle: "A sample app", version: "1.0", icon: "app.fill", tint: "cyan"),
        AppItem(name: "Another App", developer: "Developer", subtitle: "Something useful", version: "2.1", icon: "sparkles", tint: "purple"),
        AppItem(name: "Cool Tool", developer: "Creator", subtitle: "A useful utility", version: "1.4", icon: "wrench.and.screwdriver.fill", tint: "blue")
    ]

    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    Text("Browse")
                        .font(.largeTitle.bold())

                    Text("Featured")
                        .font(.title2.bold())

                    ForEach(apps) { app in
                        AppCard(app: app)
                    }

                    Text("Recently Added")
                        .font(.title2.bold())

                    Text("Apps from your sources.")
                        .foregroundStyle(.secondary)
                }
                .padding()
            }
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}