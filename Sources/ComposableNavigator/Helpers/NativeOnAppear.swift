import SwiftUI

extension View {
  func nativeOnAppear(_ perform: @escaping () -> Void) -> some View {
    #if canImport(UIKit)
    return uiKitOnAppear(perform)
    #elseif canImport(AppKit)
    return appKitOnAppear(perform)
    #endif
  }
}
