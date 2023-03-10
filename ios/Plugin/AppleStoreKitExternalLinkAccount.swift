import Foundation
import StoreKit

/**
 * The `AppleStoreKitExternalLinkAccount` class provides methods to check whether the app can open the external link account and to open it.
 * If the device's iOS version is 16.0 or greater, the class uses the `StoreKit.ExternalLinkAccount` API to perform these operations. Otherwise, it falls back to the `SKPaymentQueue.canMakePayments()` method.
 */
@objc public class AppleStoreKitExternalLinkAccount: NSObject {
    
    /**
     * Returns a boolean value that indicates whether the app can open the external link account.
     * If the device's iOS version is 16.0 or greater, the method uses the `StoreKit.ExternalLinkAccount.canOpen` property to perform the check. Otherwise, it falls back to the `SKPaymentQueue.canMakePayments()` method.
     */
    @objc public func canOpen() async -> Bool {
        if #available(iOS 16.0, *) {
            return await StoreKit.ExternalLinkAccount.canOpen
        } else {
            return SKPaymentQueue.canMakePayments()
        }
    }
    
    /**
     * Presents a continuation sheet that enables people to choose whether to open your app’s link to an external website for account creation or management.
     * If the device's iOS version is 16.0 or greater, the method uses the `StoreKit.ExternalLinkAccount.open()` method to perform the operation. Otherwise, it throws `AppleStoreKitExternalLinkAccountErrorEnum.defaultImplementationNotAvailable`.
     *
     * Throws:
     * `AppleStoreKitExternalLinkAccountErrorEnum.cannotBeOpened` if the external link account modal cannot be opened.
     * `AppleStoreKitExternalLinkAccountErrorEnum.defaultImplementationNotAvailable` if the default implementation for the external link account functionality is not available.
     */
    @objc public func open() async throws {
        if #available(iOS 16.0, *) {
            do {
                return try await StoreKit.ExternalLinkAccount.open()
            } catch {
                throw AppleStoreKitExternalLinkAccountErrorEnum.cannotBeOpened;
            }
        } else {
            throw AppleStoreKitExternalLinkAccountErrorEnum.defaultImplementationNotAvailable
        }
    }
}
