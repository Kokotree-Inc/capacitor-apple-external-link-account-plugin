import Foundation
import Capacitor

/**
 * A Capacitor plugin that provides external link account functionality on Apple platforms using StoreKit.
 * This class implements the plugin methods for checking whether external link account functionality is available and opening a continuation sheet to allow users to choose whether to open an external website for account creation or management.
 * The plugin uses the `AppleStoreKitExternalLinkAccount` class to handle the actual functionality.
 *
 * Please read the Capacitor iOS Plugin Development Guide
 * here: https://capacitorjs.com/docs/plugins/ios
 */
@objc(AppleStoreKitExternalLinkAccountPlugin)
public class AppleStoreKitExternalLinkAccountPlugin: CAPPlugin {
    private let appleStoreKitExternalLinkAccount = AppleStoreKitExternalLinkAccount()
    
    @objc public func canOpen(_ call: CAPPluginCall) {
        Task {
            call.resolve([
                "value": await appleStoreKitExternalLinkAccount.canOpen()
            ])
        }
    }
    
    @objc public func open(_ call: CAPPluginCall) {
        Task {
            do {
                try await appleStoreKitExternalLinkAccount.open()
                call.resolve()
            }
            catch AppleStoreKitExternalLinkAccountErrorEnum.cannotBeOpened {
                call.reject("The external link account modal cannot be opened because the functionality is not available.", nil, AppleStoreKitExternalLinkAccountErrorEnum.cannotBeOpened)
            }
            catch AppleStoreKitExternalLinkAccountErrorEnum.defaultImplementationNotAvailable {
                call.unavailable("The default implementation for the external link account functionality is not available. You must implement it manually.")
            }
            catch {
                call.reject("The external link account modal cannot be opened due to an unexpected error.", nil, error)
            }
        }
    }
}
