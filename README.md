# CognoChatbot-iOS

iOS SDK that opens an EasyChat chatbot inside a native app. It verifies the bot's
access token against the EasyChat server, then shows the bot in a `WKWebView` and
bridges native features (speech-to-text, text-to-speech, session IDs, minimize/close)
to the web widget.

Published as **`Exo-CognoChatbot-iOS`** through **Swift Package Manager** (module
`Exo_CognoChatbot_iOS`). From 8.0.2 on, new versions ship through SPM only;
**8.0.1 is the last CocoaPods release** (CocoaPods trunk is read-only from December 2026).

## Install

### Swift Package Manager

In Xcode: **File → Add Package Dependencies…**, enter

```
https://github.com/cognoai/chatbot-ios.git
```

choose a version (8.0.2 or later), and add the **Exo-CognoChatbot-iOS** library to your app target.

Or in a `Package.swift`:

```swift
dependencies: [
    .package(url: "https://github.com/cognoai/chatbot-ios.git", from: "8.0.2"),
],
targets: [
    .target(name: "YourApp", dependencies: [
        .product(name: "Exo-CognoChatbot-iOS", package: "chatbot-ios"),
    ]),
]
```

### Moving from CocoaPods to SPM

Apps on the `Exo-CognoChatbot-iOS` pod (8.0.1 or earlier) keep working, but get no new
versions. To move: remove the `pod 'Exo-CognoChatbot-iOS'` line, run `pod install`, then
add the package as above. The module name is unchanged, so `import Exo_CognoChatbot_iOS`
and all calls stay as they are.

## Use

```swift
import Exo_CognoChatbot_iOS

Constants.botUrl = "https://<your-easychat-domain>"
Constants.botId = "<bot id>"
Constants.accessToken = "<bot access token>"

let chatbot = ChatbotSDK()
chatbot.verifyToken(viewController: self) { verified in
    // On success the SDK has already presented the chatbot.
}
```

The app's `Info.plist` needs `NSMicrophoneUsageDescription` and
`NSSpeechRecognitionUsageDescription` for voice input.

### Configuration

Set these on `Constants` before calling `verifyToken`:

| Property | Required | Meaning |
|---|---|---|
| `botUrl` | yes | Your EasyChat domain, e.g. `https://<your-easychat-domain>` (no trailing slash) |
| `botId` | yes | Bot ID, from the bot's iOS channel page in the EasyChat console |
| `accessToken` | yes | Bot access token, from the same page |
| `chatbotSelectedLanguage` | no | Language code to open the bot in; default `en` |
| `customParams` | no | Extra query parameters for the bot, e.g. `"user_id=42&city=Dubai"`; values must already be URL-encoded |
| `campaignLinkQueryId` | no | Campaign link query ID, when the bot is opened from a campaign link |
| `hideWelcomeMessageAtStart` | no | `true` hides the welcome message when the bot opens |

`verifyToken` checks the token with the EasyChat server and, on success, presents the
chatbot full screen. After that, `dispWebView(viewController:)` presents it again.

Known limit: the video recorder widget does not work inside the WebView.

## Requirements

- iOS 12+
- Xcode 14+ (the package uses swift-tools-version 5.7)
- Swift 5, no third-party dependencies (Foundation, WebKit, AVFoundation, Speech)

## Build and test

There is no test target. To check a change, build the package for iOS:

```bash
swift build --triple arm64-apple-ios15.0-simulator \
  --sdk "$(xcrun --sdk iphonesimulator --show-sdk-path)"
```

or open `Package.swift` in Xcode and build for an iOS simulator.

## Release

A release is a git tag; there is nothing to upload.

1. Merge to `v8.0-version-master`.
2. Tag that commit with the next version and push the tag:
   `git tag 8.0.3 && git push origin 8.0.3`.
3. In EasyChat, bump the tag in the iOS "Integration Document" link
   (`EasyChatApp/templates/EasyChatApp/channels/ios_channel.html`) to the new version.
4. Never move or delete a pushed tag — apps pin to what it pointed at. Ship a fix as a new tag.

`CognoChatbot-iOS/Exo-CognoChatbot-iOS.podspec` stays only as the record of the last
CocoaPods release (8.0.1); do not bump or push it.

## Depends on / used by

- Depends on the EasyChat server endpoints `/chat/verify-access-token/` and
  `/livechat/get-livechat-session-expire/`, and the chatbot web widget.
- Used by customer iOS apps (e.g. Americana) that embed the EasyChat chatbot.
