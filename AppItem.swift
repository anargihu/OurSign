import Foundation

struct AppItem: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let developer: String
    let subtitle: String
    let version: String
    let icon: String
    let tint: String
}