import SwiftUI

struct AppsView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    Text("My Apps")
                        .font(.largeTitle.bold())

                    Text("Installed")
                        .font(.title2.bold())

                    ContentUnavailableView(
                        "No Apps Yet",
                        systemImage: "apps.iphone",
                        description: Text("Apps you install will appear here.")
                    )
                }
                .padding()
            }
        }
    }
}