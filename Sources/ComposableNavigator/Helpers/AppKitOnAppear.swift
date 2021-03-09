#if canImport(AppKit)
import AppKit
import SwiftUI

struct AppKitAppear: NSViewControllerRepresentable {
  final class NSAppearViewController: NSViewController {
    var action: () -> Void = {}

//    override func viewDidAppear(_ animated: Bool) {
//      action()
//    }
  }

  let action: () -> Void

  func makeNSViewController(context: Context) -> NSAppearViewController {
    let vc = NSAppearViewController()
    vc.action = action
    return vc
  }

  func updateNSViewController(_ controller: NSAppearViewController, context: Context) { }
}

extension View {
  /// Unfortunately, onAppear is broken in SwiftUI iOS >14.
  /// Therefore, we fallback to UIKit's viewDidAppear method in `Routed<Content>` to determine when a screen is shown.
  /// [Apple Developer Forums Discussion](https://developer.apple.com/forums/thread/655338)
  func appKitOnAppear(_ perform: @escaping () -> Void) -> some View {
    self.background(AppKitAppear(action: perform))
  }
}
#endif
