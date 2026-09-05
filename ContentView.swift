import SwiftUI

struct ContentView: View {
    @State private var selectedTab = 0

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

            OurSignTabBar(selectedTab: $selectedTab)
                .padding(.horizontal, 18)
                .padding(.bottom, 10)
        }
        .ignoresSafeArea(.keyboard)
    }
}

struct OurSignTabBar: View {
    @Binding var selectedTab: Int

    private let tabs = [
        ("Browse", "square.grid.2x2.fill"),
        ("My Apps", "rectangle.stack.fill"),
        ("Sources", "square.stack.3d.up.fill")
    ]

    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<tabs.count, id: \.self) { index in
                tabButton(
                    title: tabs[index].0,
                    icon: tabs[index].1,
                    index: index
                )
            }

            Button {
                withAnimation(.spring(response: 0.3, dampingFraction: 0.75)) {
                    selectedTab = 3
                }
            } label: {
                VStack(spacing: 5) {
                    OurSignSettingsIcon(active: selectedTab == 3)
                        .frame(width: 27, height: 27)

                    Text("Settings")
                        .font(.system(size: 11, weight: .medium))
                }
                .foregroundStyle(selectedTab == 3 ? .white : .secondary)
                .frame(maxWidth: .infinity)
                .frame(height: 62)
                .background {
                    if selectedTab == 3 {
                        RoundedRectangle(cornerRadius: 18)
                            .fill(.white.opacity(0.1))
                    }
                }
            }
            .buttonStyle(.plain)
            .accessibilityLabel("Settings")
        }
        .padding(8)
        .background(.ultraThinMaterial)
        .clipShape(RoundedRectangle(cornerRadius: 27))
        .overlay {
            RoundedRectangle(cornerRadius: 27)
                .stroke(.white.opacity(0.12), lineWidth: 1)
        }
        .shadow(color: .black.opacity(0.35), radius: 25, y: 10)
    }

    private func tabButton(title: String, icon: String, index: Int) -> some View {
        Button {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.75)) {
                selectedTab = index
            }
        } label: {
            VStack(spacing: 5) {
                Image(systemName: icon)
                    .font(.system(size: 21, weight: .semibold))
                    .frame(height: 27)

                Text(title)
                    .font(.system(size: 11, weight: .medium))
            }
            .foregroundStyle(selectedTab == index ? .white : .secondary)
            .frame(maxWidth: .infinity)
            .frame(height: 62)
            .background {
                if selectedTab == index {
                    RoundedRectangle(cornerRadius: 18)
                        .fill(.white.opacity(0.1))
                }
            }
        }
        .buttonStyle(.plain)
        .accessibilityLabel(title)
    }
}

struct OurSignSettingsIcon: View {
    let active: Bool

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 8)
                .stroke(
                    LinearGradient(
                        colors: [.cyan, .blue, .purple],
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    ),
                    lineWidth: 2.2
                )
                .frame(width: 23, height: 23)

            Circle()
                .stroke(active ? .white : .secondary, lineWidth: 2)
                .frame(width: 9, height: 9)

            Circle()
                .fill(active ? .white : .secondary)
                .frame(width: 3.5, height: 3.5)
        }
    }
}