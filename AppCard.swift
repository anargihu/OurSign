import SwiftUI

struct AppCard: View {
    let app: AppItem

    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: app.icon)
                .font(.system(size: 28))
                .foregroundStyle(.white)
                .frame(width: 64, height: 64)
                .background(
                    LinearGradient(
                        colors: [.cyan, .blue, .purple],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                )
                .clipShape(RoundedRectangle(cornerRadius: 18))

            VStack(alignment: .leading, spacing: 4) {
                Text(app.name)
                    .font(.headline)

                Text(app.subtitle)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)

                Text("\(app.developer) • \(app.version)")
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }

            Spacer()

            Button("Get") {}
                .buttonStyle(.borderedProminent)
                .tint(.cyan)
        }
        .padding()
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 24))
    }
}