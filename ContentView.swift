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
                case 3:
                    SettingsView()
                default:
                    BrowseView()
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)

            GlassEffectContainer(spacing: 6) {
                HStack(spacing: 5) {
                    ForEach(0..<4, id: \.self) { index in
                        Button {
                            withAnimation(.spring(response: 0.35, dampingFraction: 0.8)) {
                                selectedTab = index
                            }
                        } label: {
                            VStack(spacing: 1) {
                                Text(icons[index])
                                    .font(.system(size: 22, weight: .medium))
                                    .frame(height: 24)

                                Text(titles[index])
                                    .font(.system(size: 10, weight: .semibold))
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 52)
                            .foregroundStyle(
                                selectedTab == index
                                ? Color.white
                                : Color.white.opacity(0.65)
                            )
                        }
                        .buttonStyle(.plain)
                        .glassEffect(
                            selectedTab == index
                            ? .regular.tint(.cyan).interactive()
                            : .regular.interactive(),
                            in: RoundedRectangle(cornerRadius: 17, style: .continuous)
                        )
                    }
                }
                .padding(6)
                .background {
                    RoundedRectangle(cornerRadius: 25, style: .continuous)
                        .fill(.black.opacity(0.18))
                }
                .glassEffect(
                    .regular.interactive(),
                    in: RoundedRectangle(cornerRadius: 25, style: .continuous)
                )
            }
            .padding(.horizontal, 12)
            .padding(.bottom, 8)
        }
        .preferredColorScheme(.dark)
    }
}