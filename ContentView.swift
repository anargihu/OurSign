import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0

    private let titles = ["Browse", "My Apps", "Sources", "Settings"]
    private let icons = ["⌂", "□", "⚿", "⚙︎"]

    var body: some View {
        ZStack(alignment: .bottom) {
            Group {
                switch selectedTab {
                case 0:
                    BrowseView()
                case 1:
                    AppsView()
                case 2:
                    SourcesView()
                default:
                    SettingsView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            CodePenGlassBar {
                HStack(spacing: 8) {
                    ForEach(0..<4, id: \.self) { index in
                        Button {
                            withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
                                selectedTab = index
                            }
                        } label: {
                            VStack(spacing: 4) {
                                Text(icons[index])
                                    .font(.system(size: 25, weight: .medium))
                                    .frame(height: 29)

                                Text(titles[index])
                                    .font(.system(size: 11, weight: .medium))
                            }
                            .foregroundStyle(selectedTab == index ? .white : .white.opacity(0.62))
                            .frame(maxWidth: .infinity)
                            .frame(height: 64)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .padding(8)
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 10)
        }
        .preferredColorScheme(.dark)
    }
}

struct CodePenGlassBar<Content: View>: View {
    @ViewBuilder let content: () -> Content

    var body: some View {
        content()
            .background {
                RoundedRectangle(cornerRadius: 30, style: .continuous)
                    .fill(.white.opacity(0.10))
                    .background {
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .fill(.ultraThinMaterial)
                    }
                    .overlay {
                        RoundedRectangle(cornerRadius: 30, style: .continuous)
                            .stroke(
                                LinearGradient(
                                    colors: [
                                        .white.opacity(0.42),
                                        .white.opacity(0.08),
                                        .cyan.opacity(0.18)
                                    ],
                                    startPoint: .topLeading,
                                    endPoint: .bottomTrailing
                                ),
                                lineWidth: 1
                            )
                    }
                    .shadow(color: .black.opacity(0.35), radius: 24, y: 10)
            }
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
    }
}