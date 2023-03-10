import Foundation
/**
 * Defines an enumeration of possible errors that can be thrown by the AppleStoreKitExternalLinkAccount plugin.
 */
enum AppleStoreKitExternalLinkAccountErrorEnum: Error {
    /**
       * Indicates that the external link account functionality cannot be opened.
       */
    case cannotBeOpened
    /**
     * Indicates that the default implementation is not available for the external link account functionality.
     */
    case defaultImplementationNotAvailable
 
}
