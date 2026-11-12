// swift-tools-version:5.7
import PackageDescription

// Mirrors Exo-CognoChatbot-iOS.podspec: same sources, and the same module name
// CocoaPods derives from the pod name, so `import Exo_CognoChatbot_iOS` works
// unchanged when an app moves from the pod to SPM.
let package = Package(
    name: "Exo-CognoChatbot-iOS",
    platforms: [.iOS(.v12)],
    products: [
        .library(name: "Exo-CognoChatbot-iOS", targets: ["Exo_CognoChatbot_iOS"]),
    ],
    targets: [
        .target(
            name: "Exo_CognoChatbot_iOS",
            path: "CognoChatbot-iOS/CognoChatbot-iOS",
            exclude: ["CognoChatbot_iOS.h"]
        ),
    ]
)
